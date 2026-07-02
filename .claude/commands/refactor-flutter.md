# /refactor-flutter — Refactor Flutter Code to Conform to Rules + Folder Structure

**Purpose:** Bring existing Flutter code into conformance with `flutter-rules`, the layered architecture, and the recommended `lib/` structure — without changing behavior.

**When to use:**
- Code was built fast and needs to be aligned to the architecture.
- A file mixes layers (UI + data), hardcodes tokens, or sits in the wrong folder.
- Preparing a feature for review/QA.

**Required context (read these first):**
- Canonical brief (`lib/` structure, tech direction, brand tokens).
- `.claude/rules/flutter-rules.md`.
- Design-system token definitions.
- The target files/feature to refactor.

**Inputs to specify when invoking:**
- File(s) or feature folder to refactor.
- Any behavior that must be preserved exactly.

**Execution steps:**
1. Read the target code and map current responsibilities to layers (presentation / domain / data).
2. Identify violations: mixed layers, business logic in widgets, direct source access from UI, hardcoded hex/px, wrong folder, non-immutable models, snake_case JSON keys, missing mappers.
3. Move files to correct locations under `app/ core/ shared/ features/ data/ design_system/`. Feature folders map to modules (scout, vault, review, flow, briefs).
4. Extract domain models (immutable, camelCase) and mappers (`data/mappers/`). Repositories expose domain types, sources return DTOs.
5. Replace raw colors/typography with `TonaryColors.*` / `TonaryTypography.*`; move spacing to the scale.
6. Normalize state to Riverpod providers/notifiers (Recommendation; Bloc acceptable if already established). Routing via go_router in `app/router/`.
7. Keep it pragmatic — do not over-engineer; no needless abstraction layers.
8. Run analyzer/format; ensure no behavior change (same routes, same rendered output).

**Output / report format:**
- **Before → After** file moves table (absolute paths).
- Violations fixed, grouped by category.
- Any behavior-preserving assumptions made.
- Residual issues as `Open Question:`; optional improvements as `Recommendation:`.
- Verification note (analyzer clean / app builds).

**Guardrails:**
- Behavior-preserving only — no new features, no visual changes.
- Do not introduce the legacy purple theme, web patterns, or desktop-first layout.
- Prefer editing existing files over creating new ones; only add files the architecture requires.
- If a change is risky, describe it and ask before applying.
