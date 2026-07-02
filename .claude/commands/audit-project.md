# /audit-project — Audit Tonary.io State vs Framework

**Purpose:** Produce an evidence-based snapshot of the current Tonary.io project against the intended `.claude` framework — what exists, what is missing, and where the code/content has drifted from the canonical brief, schemas, and workflows.

**When to use:**
- Start of a work session, to orient before building.
- After a batch of feature work, to detect regressions or drift.
- Before a release/QA cut, to confirm structure and content coverage.

**Required context (read these first):**
- Canonical brief: the shared source of truth (naming, modules, tech direction, brand tokens).
- `.claude/schemas/*.schema.md` — all 6 record schemas (plugin, preset, workflow-recipe, sound-design-note, source-reference, user-session).
- `.claude/workflows/*` — feature-build, flutter-screen-build, migration workflows.
- The Flutter `lib/` tree (if it exists yet) and any bundled seed JSON dataset.

**Execution steps:**
1. Confirm identity guardrails: product name is **Tonary** (project **Tonary.io**); the 5 modules are Scout, Vault, Review, Flow, Briefs. Flag any FL-Studio interface terms (Browser, Channel Rack, Mixer, Playlist) used as Tonary-owned names.
2. Map the `lib/` structure against the recommended layout (`app/`, `core/`, `shared/`, `features/`, `data/`, `design_system/`). Record each folder as Present / Missing / Partial.
3. For each feature folder (home, scout, vault, review, flow, briefs, search, settings, onboarding), note whether presentation/domain/data layers exist.
4. Validate seed data: sample records against each schema. Check `id` = kebab-case, JSON keys = camelCase, and that every record type except user-session carries a non-empty `sources[]`.
5. Check design-system tokens exist in Dart (`TonaryColors`, `TonaryTypography`) and match the brand hex values. Flag hardcoded colors outside `design_system/`.
6. Detect legacy drift: any purple/glassmorphism theme, Next.js/React artifacts, `.ico`/`desktop.ini`, or copied web component code.
7. Compute coverage counts (features scaffolded, schemas backed by seed data, screens built).

**Output / report format (Markdown):**
- **Summary** — one paragraph health verdict + a 0–100 readiness score with rationale.
- **Structure table** — `Area | Expected | Found | Status (OK/Partial/Missing)`.
- **Drift findings** — bullet list, each with file path + severity (High/Med/Low).
- **Schema/seed coverage** — per-schema record counts and validation failures.
- **Top 5 next actions** — ordered, each a concrete `/build-*` or `/migrate-content` follow-up.
- Label uncertainties `Open Question:` and suggestions `Recommendation:`.

**Guardrails:**
- Never claim a file/folder exists unless verified by reading it. Report absence explicitly.
- Do not create or modify files — this is a read-only audit. Do not fabricate record counts.
- Keep findings actionable and cross-linked to the schema/workflow file that defines the expectation.
