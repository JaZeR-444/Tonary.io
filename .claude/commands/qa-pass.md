# /qa-pass — Run QA Gates and Produce a QA Report

**Purpose:** Execute the Tonary QA gates across code quality, architecture, data integrity, brand compliance, and mobile UX, then produce a structured QA report with a ship/no-ship verdict.

**When to use:**
- Before merging a feature or screen.
- Before a release/demo cut.
- After `/migrate-content` to validate new seed data.

**Required context (read these first):**
- Canonical brief (brand tokens, tech direction, schemas list).
- `.claude/rules/flutter-rules.md`, brand-kit, mobile-first rules.
- All 6 `.claude/schemas/*.schema.md`.
- Scope: files/features/records under test.

**QA gates (run in order):**
1. **Build & static:** `flutter analyze` clean; `flutter format` applied; no unused imports; no TODO stubs shipping.
2. **Architecture:** Layer separation respected (UI ↛ sources directly); folders match the `lib/` structure; models immutable + camelCase.
3. **Design system:** No raw hex/px outside `design_system/`; color law honored; display face restricted to H1–H3/hero; buttons ≥14px/600.
4. **Screen states:** Every screen renders loading, empty, error, loaded; empty state guides next action.
5. **Accessibility:** ≥44px targets, semantics labels, contrast, meaning-not-by-color-alone, reduced-motion honored.
6. **Data integrity:** Sample seed records validate against schemas; ids kebab-case, keys camelCase; every record except user-session has non-empty `sources[]`; no fabricated plugin values (placeholders labeled).
7. **Naming/identity:** Product = Tonary; modules = Scout/Vault/Review/Flow/Briefs; no FL Studio interface terms used as Tonary-owned names.
8. **Offline-first:** App functions without network; seed dataset loads locally.

**Output / report format (Markdown):**
- **Verdict:** Ship / Ship-with-fixes / No-ship + one-line rationale.
- **Gate results table:** `Gate | Result (Pass/Warn/Fail) | Notes`.
- **Defects list:** `ID | Severity | Location | Description | Suggested fix`.
- **Coverage:** what was and was not tested.
- `Open Question:` for ambiguous requirements; `Recommendation:` for non-blocking polish.

**Guardrails:**
- Report only what you verified; do not assume passing gates you did not run.
- Do not fix issues during the pass unless explicitly asked — QA reports, it does not refactor.
- Never fabricate test results, record counts, or coverage numbers.
- Flag any legacy purple/glassmorphism or Next.js artifact as an automatic Fail on the design gate.
