# /migrate-content — Migrate a Plugin/Batch from DEEPER DIVES into Tonary Schemas

**Purpose:** Convert legacy plugin research (from `FL Studio Plugin ~ DEEPER DIVES`) into Tonary-owned records (Plugin, Preset, Workflow Recipe, Sound Design Note) plus Source References, and add them to the seed dataset. Migration is a MAP-first, evidence-backed process — never a bulk import.

**When to use:**
- Onboarding one plugin folder (or a small batch) into Tonary Vault/Flow/Review.
- Backfilling `sources[]` and normalizing legacy JSON into Tonary schemas.

**Required context (read these first):**
- Canonical brief (migration principle, naming rules, schemas list).
- `.claude/workflows/content-migration-workflow.md` (if present) and the migration MAP conventions.
- All 6 `.claude/schemas/*.schema.md`.
- The source plugin folder: `00-START-HERE.md`, `02-Data/{parameters,presets,rules}`, `03-Workflows/*`.

**Inputs to specify when invoking:**
- Plugin folder name (e.g., FLEX) or batch list.
- Target modules (Vault always; Flow/Review if workflows/notes exist).

**Execution steps:**
1. Build a **migration MAP** for the source: for each file, decide Keep / Rewrite / Archive / Ignore. Discard legacy web HTML/CSS/JS page setups, purple theme, `.ico`/`desktop.ini`, batch/session-summary meta-files.
2. Create the **Plugin Record**: id (kebab-case), name, vendor (Image-Line vs third-party), category, type (Generator/Effect), tier (Free/Premium), description, tags[], capabilities[], parameters reference, color. Map from legacy manifest fields but keep Tonary-owned wording.
3. Create **Source References** first for every claim you will cite (official manual page, article, original research). Then have all other records point to those `sources[]` ids. Never fabricate a source.
4. Extract **Preset Records** from `02-Data/presets` archetypes — snapshot params as illustrative unless the value is truly evidenced. Mark placeholder values clearly.
5. Convert `03-Workflows/by-goal` into **Workflow Recipe** records (pluginChain[], steps[], difficulty, timeEstimate, genreTags[]).
6. Convert notable `rules`/symptom-solution content and comparisons into **Sound Design Notes** with an honest `evidenceLevel`.
7. Normalize ids to kebab-case, keys to camelCase. Validate each record against its schema.
8. Append to the seed JSON dataset; keep provenance in a migration log entry.

**Output / report format:**
- The migration MAP table: `Source file | Decision | Target record(s) | Notes`.
- Records created per schema, with ids.
- Source References created (id → title/url/reliability).
- Validation results and any `Open Question:` where evidence was missing.
- Recommended next batch.

**Guardrails:**
- Never fabricate plugin parameter values or invent facts. If unevidenced, use a clearly labeled illustrative placeholder and note it.
- Every migrated record except user-session must carry a non-empty `sources[]`.
- Legacy content is strategic source material, not a blueprint — rewrite, don't copy.
- Do not import legacy web architecture or theming.
