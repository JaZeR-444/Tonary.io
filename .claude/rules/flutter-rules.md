# Flutter Rules

> Scope: How Tonary's Flutter/Dart code is written. Inherits [global-rules.md](global-rules.md).
> Mobile-first mandates in [mobile-first-rules.md](mobile-first-rules.md); UX in [ui-ux-rules.md](ui-ux-rules.md).

## Language & safety
- **Sound null-safety** is mandatory. No `late` without a guaranteed init path. Avoid `!` (bang) — handle null explicitly.
- Prefer `const` constructors everywhere possible (perf + rebuild avoidance). Enable `prefer_const_constructors` lint.
- No `dynamic` unless deserializing untyped JSON at a boundary; type it immediately after.
- Immutable models. Use `freezed` for data classes and unions (Recommendation, see deps).

## Architecture & layering
Layered, pragmatic: `features (presentation) → domain (models/use-cases) → data (repositories/sources)`.
- **No business logic in widgets.** Widgets render state and dispatch intent. Logic lives in notifiers/use-cases/repositories.
- Widgets read state via providers; they never call repositories or sources directly.
- Domain models are pure Dart (no Flutter imports). Data layer maps DTOs → domain via mappers.

### Recommended `lib/` structure
```
lib/
├── main.dart
├── app/            tonary_app.dart, router/, theme/, bootstrap/
├── core/           constants/, errors/, utils/, services/, storage/
├── shared/         widgets/, components/, models/, extensions/
├── features/       home/, scout/, vault/, review/, flow/, briefs/, search/, settings/, onboarding/
├── data/           repositories/, sources/, dto/, mappers/
└── design_system/  tokens/, typography/, spacing/, colors/, components/
```
Feature folders map to modules (scout→Scout, vault→Vault, review→Review, flow→Flow, briefs→Briefs).

### Feature folder shape (Recommendation)
Each `features/<name>/` contains `presentation/` (screens, widgets), `application/` (notifiers/controllers),
and optionally `domain/` if the feature owns models. Shared models go in `shared/models/` or `domain/`.

## State management — Riverpod conventions
Recommendation: **Riverpod** (alternative: Bloc). If Riverpod:
- Prefer `NotifierProvider` / `AsyncNotifierProvider` (code-gen `@riverpod`) over legacy `StateProvider` for non-trivial state.
- One provider owns one concern. Name providers `<thing>Provider`. Keep `ref.watch` in `build`, `ref.read` in callbacks.
- Never store `BuildContext` in a notifier. Side effects (nav, snackbars) belong in the widget layer.
- Dispose/autoDispose by default; keep-alive only with justification.

## Design system in code
- Source tokens live in `design_system/tokens/`, exposed via `ThemeData` + a `TonaryColors` / `TonaryTypography`
  `ThemeExtension`. Use **semantic Dart names** (`TonaryColors.bgApp`, `TonaryColors.outlineControl`) — not raw hex, not `--citrus-console-*` CSS names.
- No hardcoded hex or magic spacing in widgets. Pull from tokens/spacing scale. Enforces [brand-rules.md](brand-rules.md).

## Dependencies — no random packages
Add a dependency only with justification (need, health, maintenance, size). Prefer the platform/first-party solution first.
Recommendation — approved candidate set:

| Package | Role |
| --- | --- |
| `flutter_riverpod` / `riverpod` (+ `riverpod_annotation`, `riverpod_generator`) | State management |
| `go_router` | Declarative routing |
| `drift` (+ `sqlite3_flutter_libs`) | Structured, queryable offline storage (SQLite) |
| `freezed` (+ `freezed_annotation`) | Immutable models & unions |
| `json_serializable` (+ `json_annotation`) | JSON (de)serialization |
| `build_runner` | Codegen runner (dev) |
| `intl` | Formatting/localization |

Alternatives to flag as Recommendation, not defaults: `isar` (instead of Drift), `bloc` (instead of Riverpod).
Anything outside this list needs an `Open Question:`/justification note in the PR.

## Naming conventions
- **Files:** `snake_case.dart` (e.g. `plugin_record.dart`, `scout_screen.dart`).
- **Classes / enums / typedefs:** `PascalCase` (e.g. `PluginRecord`, `ScoutController`).
- **Members / vars / functions:** `lowerCamelCase`. **Constants:** `lowerCamelCase` (Dart style), not SCREAMING_CASE.
- **Providers:** `<name>Provider`. **Private:** leading underscore.
- One public class per file where reasonable; file name matches the class in snake_case.

## Placement rules
- Reusable UI → `shared/widgets/` or `design_system/components/`. Feature-specific UI stays in its feature.
- Repositories/sources/DTOs/mappers → `data/`. Domain models → `domain/` or `shared/models/`.
- Routing config → `app/router/`. Theme/tokens → `app/theme/` + `design_system/`.

## Hygiene
- `flutter analyze` clean; treat lints as errors in CI. Use `flutter_lints`/`very_good_analysis` (Recommendation).
- Every non-trivial logic unit gets a test (see [qa-rules.md](qa-rules.md)). No commented-out code blocks left behind.
