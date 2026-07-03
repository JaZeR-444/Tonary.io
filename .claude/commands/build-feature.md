# /build-feature — Build a Full Tonary Feature/Module

**Purpose:** Build one complete feature/module end-to-end (data → domain → presentation) following the `feature-build-workflow`, wired into routing, state, and the design system.

**When to use:**
- Standing up a new module feature (Scout, Vault, Review, Flow, Briefs) or a cross-cutting one (Search, Settings, Onboarding).
- Expanding an existing feature with a new capability that needs its own repository/use-case/screens.

**Required context (read these first):**
- Canonical brief (modules, tech direction, brand tokens, `lib/` structure).
- `.claude/workflows/feature-build-workflow.md` — the authoritative build sequence.
- Relevant `.claude/schemas/*.schema.md` for the records the feature reads/writes.
- `.claude/rules/flutter-rules.md` and design-system tokens.

**Inputs to specify when invoking:**
- Feature name + which module it maps to.
- Primary records consumed (e.g., Vault → plugin-record, preset-record).
- Screens in scope and their entry routes.

**Execution steps:**
1. Confirm scope and acceptance criteria; restate the user story ("As a producer, I can …").
2. Scaffold the feature folder: `features/<name>/{presentation,domain,data}` (or shared domain/data if records already modeled). Keep layering pragmatic.
3. Define/confirm domain models mapping 1:1 to the schema fields (camelCase Dart, immutable). Add mappers in `data/mappers/`.
4. Implement data sources + repository (Drift/SQLite queries + seed JSON load). Recommendation: Drift; flag if Isar chosen.
5. Add Riverpod providers/notifiers for state; expose loading/empty/error states.
6. Build screens via `/build-screen` for each screen in scope (mobile-first, dark, offline-first).
7. Register routes in `app/router/` (go_router). Add navigation entry points.
8. Wire empty/error/loading UI using design-system components; no raw hex.
9. Add seed/sample records if the feature needs data to demonstrate; every record (except user-session) must carry `sources[]`.
10. Self-run `/qa-pass` scope subset and fix blockers.

**Output / report format:**
- Files created/modified (absolute paths, grouped by layer).
- Routes added and provider names.
- Records/schemas touched and any new seed entries.
- Known gaps as `Open Question:` / follow-ups as `Recommendation:`.
- A short "how to run/verify" note.

**Guardrails:**
- Mobile-first Flutter only; no desktop-first layouts, no web component ports.
- Do not carry legacy purple/glassmorphism theme or Next.js patterns.
- All colors/typography via `design_system/` tokens. Violet = brand action only.
- Never fabricate plugin/preset data — use clearly labeled illustrative placeholders if real evidence is absent.
