# Data Modeling Rules

> Scope: Conventions for Tonary's schemas and seed data. Inherits [global-rules.md](global-rules.md).
> Schemas live under `..\schemas\` (relative: [../schemas/](../schemas/)). Migration discipline in [content-migration-rules.md](content-migration-rules.md).

## The target schemas
Tonary models these record types (do not invent new top-level schemas without updating this file):
**Plugin Record · Preset Record · Workflow Recipe · Sound Design Note · Source Reference · Comparison Brief · Learning Path · User Saved Item.**

## Identifiers
- **Record ids are `kebab-case`** and stable forever (e.g. `serum`, `fruity-reverb-2`, `vital-supersaw-lead`).
- Ids are **immutable** once assigned. Never rename an id to fix a typo — add an alias/migration instead; renaming breaks references, saved items, and citations.
- Ids are lowercase ASCII, hyphen-separated, no spaces, no file extensions, no `.wav`.

## JSON key style
- **JSON keys are `camelCase`** (e.g. `pluginId`, `sourceRef`, `parameterName`, `createdAt`).
- Dart models map camelCase JSON → Dart fields via `json_serializable`; kebab-case values stay verbatim inside string fields.
- Do not mix snake_case and camelCase in the same schema. camelCase is the wire format; kebab-case is only for id **values**.

## Source references are mandatory
- **Every factual record cites a Source Reference.** A Plugin/Preset/Workflow/Note record without a `sourceRef` (or `sources[]`) is invalid.
- A Source Reference identifies where a fact came from: official manual, verified vendor doc, or reviewed in-app note.
  Prefer official/manufacturer manuals; attribute them explicitly.
- Subjective notes (opinions, taste) must be marked as such and are never presented as sourced fact.

## No fabricated values
- **Never invent parameter values, ranges, defaults, preset contents, or capabilities.** If a value is unknown,
  leave it null/absent and flag it — never guess a plausible-looking number.
- Do not copy a value from a similar plugin as a stand-in. Absence is acceptable; fabrication is not.
- This is the highest-severity rule in data work (see [global-rules.md](global-rules.md) prime directive 3).

## Validation before seed
- All records pass schema validation (required fields, types, id format, `sourceRef` presence) **before** entering the seed dataset.
- Recommendation: a validation script/CI gate rejects: bad id casing, camelCase violations, missing sources, unknown enum values.
- The bundled seed JSON is the offline dataset loaded into Drift (SQLite) at first run; invalid records never ship. See [flutter-rules.md](flutter-rules.md) for storage.

## Enums & controlled vocabularies (from legacy manifest, verify before use)
- `tier`: `Free` | `Premium`. `type`: `Generator` | `Effect`. `category`: controlled list (verify per record).
- Legacy manifest fields available as source: `id, name, category, tier, type, description, tags[], capabilities[], version, color`.
  Treat legacy values as candidates to verify, not ground truth — see [content-migration-rules.md](content-migration-rules.md).

## Immutability & audit
- Source IDs and Source References are immutable once published. Corrections append, they don't silently overwrite.
- Timestamps (`createdAt`, `updatedAt`) are ISO-8601 UTC. User Saved Items reference record ids, never embed copies.

Open Question: Do we version individual records (schema `version` field) or version the whole dataset?
Recommendation: version the dataset (single seed manifest version) plus a per-record `version` for plugin data drift.
