# Data Layer — Tonary

The `data/` layer: repositories, sources, DTOs, mappers, and local persistence.
Parent: [flutter-mobile-architecture.md](./flutter-mobile-architecture.md). Related:
[offline-first-strategy.md](./offline-first-strategy.md),
[content-knowledge-base.md](./content-knowledge-base.md). Schemas live in
[../schemas/](../schemas/).

## Shape

```
data/
├── repositories/   # domain-facing interfaces + impls (the ONLY thing features use)
├── sources/        # drift/ (DAO), seed/ (bundled JSON loader), remote/ (future)
├── dto/            # serialization objects mirroring DB/JSON shapes
└── mappers/        # DTO ⇄ domain model conversion
```

**Local-first:** the on-device **Drift (SQLite)** database is the *source of truth*.
A **bundled seed JSON** dataset in `assets/seed/` hydrates Drift on first run.
Remote/sync is a **future** additive source behind the same repository interfaces.

**Recommendation: Drift** for structured, queryable, relational records with
type-safe queries and migrations. *Alternative: Isar* (object DB, simpler for
document-shaped data, weaker relational querying).

## Repository pattern

Features and providers depend on **repository interfaces** (declared in the domain/
`shared` sense), never on sources directly. Each repository:

1. Reads from the Drift source (local-first).
2. Maps DTO → domain model at the boundary (domain models never carry DB annotations).
3. Returns domain models or a typed `Failure` from `core/errors/`.

```dart
abstract interface class VaultRepository {
  Future<List<PluginSummary>> listPlugins({PluginFilter? filter});
  Future<Plugin> pluginById(String id);
  Future<List<Preset>> presetsForPlugin(String pluginId);
}
```

```dart
class VaultRepositoryImpl implements VaultRepository {
  VaultRepositoryImpl(this._db);
  final TonaryDatabase _db;

  @override
  Future<Plugin> pluginById(String id) async {
    final row = await _db.pluginDao.findById(id);   // DTO/row
    return PluginMapper.toDomain(row);               // → domain model
  }
}
```

## Drift tables (Tonary schemas)

One Drift table per core Tonary schema. Definitions align with
[../schemas/](../schemas/) — treat those files as the authoritative field lists; the
table sketches below are the persistence projection.

| Drift table | Tonary schema | Key fields (indicative) |
|-------------|---------------|-------------------------|
| `Plugins` | **Plugin Record** | `id` (kebab-case PK), `name`, `category`, `tier` (Free/Premium), `type` (Generator/Effect), `description`, `tags` (json), `capabilities` (json), `color`, `version` |
| `Presets` | **Preset Record** | `id` PK, `pluginId` FK, `name`, `category`, `description`, `parameters` (json), `tags` (json) |
| `WorkflowRecipes` | **Workflow Recipe** | `id` PK, `title`, `goal`, `instrument`, `steps` (json), `pluginIds` (json), `difficulty` |
| `SoundDesignNotes` | **Sound Design Note** | `id` PK, `subjectType`, `subjectId`, `body`, `sourceRefIds` (json), `createdAt` |
| `SourceReferences` | **Source Reference** | `id` PK, `title`, `kind`, `locator`, `credibility`, `retrievedAt` |
| `UserSavedItems` | **User Saved Item** | `id` PK, `itemType`, `itemId`, `savedAt`, `note` (nullable) |

Notes:
- Complex/nested fields (`tags[]`, `capabilities[]`, `parameters`, `steps`) are stored
  as JSON text columns (or normalized join tables where queries demand it —
  **Recommendation:** start with JSON columns, normalize only proven query hot-paths).
- `SourceReferences` back the evidence trail for **Tonary Review** and grounded
  answers in **Scout/Briefs** (see [ai-assistant-architecture.md](./ai-assistant-architecture.md)).
- `UserSavedItems` is the one user-writable table; all others are seed-derived until a
  backend exists.

## Sources

- **`sources/drift/`** — `TonaryDatabase` + DAOs. Type-safe queries, migrations.
- **`sources/seed/`** — reads `assets/seed/*.json`, deserializes to DTOs, bulk-inserts
  into Drift on first run (idempotent; guarded by a `seedVersion` marker in a
  key-value store so re-hydration only runs when the bundled dataset version changes).
- **`sources/remote/`** — **future.** Empty/stub today.

## DTOs and mappers

- **DTOs** live in `dto/`, mirror the JSON/DB shape, own (de)serialization
  (`json_serializable`/Drift row classes). They may be messy/nullable to match source
  reality.
- **Mappers** live in `mappers/`, convert DTO → domain (and domain → DTO for the one
  writable table). They are pure, unit-tested, and the *only* place field-name and
  type reconciliation happens. Legacy `manifest.json` fields (id, name, category, tier,
  type, description, tags[], capabilities[], version, color) are normalized here per
  [../rules/content-migration-rules.md](../rules/content-migration-rules.md).

```dart
class PluginMapper {
  static Plugin toDomain(PluginRow r) => Plugin(
    id: r.id,
    name: r.name,
    category: r.category,
    tier: PluginTier.fromString(r.tier),
    type: PluginType.fromString(r.type),
    tags: _decodeStringList(r.tags),
    capabilities: _decodeStringList(r.capabilities),
  );
}
```

## Sync / remote — future

**Open Question:** backend/sync provider is undecided (Supabase, Firebase, custom
API). The layered design isolates this: adding sync means implementing a
`sources/remote/` source and a caching/refresh policy inside the existing repository —
**no changes to features, providers, domain models, or the seed pipeline.** Until
then, the app is fully functional offline from the seed dataset. See
[offline-first-strategy.md](./offline-first-strategy.md).

## Do / Don't

- Do keep all persistence details inside `data/`; features see only repositories.
- Do make mappers pure and fully unit-tested.
- Don't leak DTOs or Drift row types into `shared/models/` or `features/`.
- Don't fabricate plugin data — every record traces to a real migrated source
  (see [content-knowledge-base.md](./content-knowledge-base.md)).
