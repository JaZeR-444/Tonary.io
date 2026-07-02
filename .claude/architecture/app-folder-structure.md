# App Folder Structure — Tonary `lib/`

The canonical `lib/` tree for the Tonary Flutter app, with per-folder rules. Parent
context: [flutter-mobile-architecture.md](./flutter-mobile-architecture.md).

```
lib/
├── main.dart                 # entry point → runs bootstrap → TonaryApp
├── app/                      # app-wide wiring
│   ├── tonary_app.dart       # root MaterialApp.router + ThemeData/extensions
│   ├── router/               # go_router config, routes, guards, shell
│   ├── theme/                # ThemeData assembly from design_system tokens
│   └── bootstrap/            # init: DB open, seed hydration, DI overrides
├── core/                     # cross-cutting, feature-agnostic
│   ├── constants/            # app constants, asset paths, enums
│   ├── errors/               # Failure/AppException types, error mapping
│   ├── utils/                # pure helpers (formatting, result types)
│   ├── services/             # platform + external service wrappers (AI client)
│   └── storage/              # Drift database, key-value, seed loader
├── shared/                   # reusable across features (domain-ish)
│   ├── widgets/              # generic widgets not tied to one feature
│   ├── components/           # composed shared UI blocks
│   ├── models/               # domain models (Flutter-free where possible)
│   └── extensions/           # Dart/Flutter extension methods
├── features/                 # one folder per module/screen area
│   ├── home/                 # dashboard / launchpad
│   ├── scout/                # → Tonary Scout
│   ├── vault/                # → Tonary Vault
│   ├── review/               # → Tonary Review
│   ├── flow/                 # → Tonary Flow
│   ├── briefs/               # → Tonary Briefs
│   ├── search/               # global search across records
│   ├── settings/             # preferences, about, data refresh
│   └── onboarding/           # first-run intro + seed setup
├── data/                     # data access
│   ├── repositories/         # domain-facing repository impls
│   ├── sources/              # Drift DAO, seed JSON, future remote
│   ├── dto/                  # serialization objects (DB/JSON shapes)
│   └── mappers/              # DTO ⇄ domain conversion
└── design_system/            # the Tonary visual language
    ├── tokens/               # raw brand tokens (colors, motion, radius)
    ├── typography/           # Inter / Space Grotesk / IBM Plex Mono styles
    ├── spacing/              # spacing + layout scale
    ├── colors/               # semantic color roles (TonaryColors)
    └── components/           # branded buttons, cards, chips, inputs
```

Each feature folder is internally sub-structured:
`features/<name>/{presentation/ (screens, widgets), providers/, data/ (optional feature-scoped repo)}`.

## Folder guide

### `app/`
- **Purpose:** App composition root — the only place that knows about *everything*.
- **Belongs:** `TonaryApp`, router setup, `ThemeData` assembly, bootstrap/init.
- **Does NOT:** hold feature logic, business rules, or data queries.
- **Claude should use this when…** wiring startup, routes, or global theme.

### `core/`
- **Purpose:** Cross-cutting infrastructure with no feature knowledge.
- **Belongs:** constants, error/`Failure` types, pure utils, service wrappers
  (`core/services/` holds the AI client), storage (`core/storage/` holds the Drift
  DB + seed loader).
- **Does NOT:** import from `features/` or `data/repositories`; contain UI.
- **Claude should use this when…** adding a utility, error type, or a service/DB
  primitive used by more than one feature.

### `shared/`
- **Purpose:** Reusable domain + UI shared by multiple features.
- **Belongs:** domain **models** (`shared/models/`), generic widgets/components,
  extensions.
- **Does NOT:** contain feature-specific screens or one-off widgets; import a feature.
- **Claude should use this when…** a model or widget is needed by two+ features.

### `features/`
- **Purpose:** Vertical slices — one folder per module/screen area.
- **Belongs:** screens, feature widgets, feature-scoped Riverpod providers, optional
  feature-scoped repository.
- **Does NOT:** import a sibling feature (**hard rule** — go through `shared/`), hold
  design tokens, or talk to Drift/HTTP directly (go through `data/`).
- **Claude should use this when…** building or changing anything a user sees inside
  one module.

### `data/`
- **Purpose:** All data access and shape conversion.
- **Belongs:** repositories (domain-facing), sources (Drift DAO, seed JSON, future
  remote), DTOs, mappers.
- **Does NOT:** import `presentation`/`features`; leak DTOs into domain (mappers
  convert at the boundary).
- **Claude should use this when…** adding a query, source, or persistence concern.
  Details: [data-layer.md](./data-layer.md).

### `design_system/`
- **Purpose:** The Tonary dark-first visual language.
- **Belongs:** raw tokens, typography, spacing, semantic colors (`TonaryColors`),
  branded components.
- **Does NOT:** contain business logic, data access, or feature screens; use legacy
  `--citrus-console-*` names.
- **Claude should use this when…** styling anything or adding a reusable branded
  component. Enforce the color law (amber = action, cyan = focus, green = affirmative,
  violet = exploratory, red = exceptional).

## Feature → module map

| Feature folder | Tonary module | Role |
|----------------|---------------|------|
| `features/scout` | **Tonary Scout** | AI recommendations, plugin/preset/chain matching |
| `features/vault` | **Tonary Vault** | Curated plugin/preset/chain/parameter records |
| `features/review` | **Tonary Review** | Source review + evidence-backed notes |
| `features/flow` | **Tonary Flow** | Workflow recipes, setup paths, playbooks |
| `features/briefs` | **Tonary Briefs** | Fast explanations, comparisons, next steps |
| `features/home` | — | Dashboard / launchpad into modules |
| `features/search` | — | Global search across Vault/Flow/Briefs records |
| `features/settings` | — | Preferences, about, data refresh |
| `features/onboarding` | — | First-run intro + seed hydration |

## Assets (outside `lib/`)

`assets/seed/*.json` — bundled seed dataset that hydrates Drift on first run (see
[data-layer.md](./data-layer.md) and
[content-knowledge-base.md](./content-knowledge-base.md)). Fonts under `assets/fonts/`.

**Recommendation:** keep feature folders flat and shallow; only introduce a
feature-scoped `data/` sub-folder when a feature owns queries no other feature uses.
