# Migration Map — FL Studio Master Hub → Tonary.io

> Generated: 2026-07-02. This is a **map, not an import.** No source content is migrated into app
> data yet. Each row is a recommendation to Keep / Rewrite / Archive / Ignore, with a target Tonary
> module and schema. Governed by `.claude/rules/content-migration-rules.md`.

## Legend
- **Decision:** `Keep` (migrate largely as-is, still validate) · `Rewrite` (re-author into Tonary voice/schema) · `Archive` (retain as fallback, don't ship) · `Ignore` (do not migrate).
- **Target schema** files: `.claude/schemas/`.
- Every migrated record MUST carry `sources[]` → a `source-reference` record. Never fabricate.

## Migration table

| # | Source folder / file | Content type | Decision | Target module | Target schema | Notes | Risks | Next action |
|---|---|---|---|---|---|---|---|---|
| 1 | `DEEPER DIVES/<Plugin>/README.md` + `00-START-HERE.md` | Plugin overview prose | Rewrite | Vault | `plugin-record` | Extract name/type/category/description; drop legacy nav copy | Prose quality varies | Author 1 pilot plugin record end-to-end |
| 2 | `DEEPER DIVES/<Plugin>/02-Data/parameters/*.json` | Parameter definitions (JSON) | Keep* | Vault | `plugin-record` (parameters) | *Keep only where values verifiable vs official manual | Some values may be fabricated/partial | Validate against manual before seed |
| 3 | `DEEPER DIVES/<Plugin>/02-Data/presets/*.json` | Preset archetypes (JSON) | Keep* | Vault | `preset-record` | e.g. FLEX `genre-templates.json`, `envelope-shapes.json` | Confirm these are archetypes, not copyrighted factory presets | Legal review on preset reproduction |
| 4 | `DEEPER DIVES/<Plugin>/02-Data/rules/*.json` | Symptom→solution rules | Rewrite | Briefs / Scout | `sound-design-note` | Great for "next-step" Briefs; re-author into notes | Rules assert claims — need evidence | Attach source per rule |
| 5 | `DEEPER DIVES/<Plugin>/03-Workflows/by-goal|by-instrument/*` | Task/instrument workflows | Rewrite | Flow | `workflow-recipe` | Convert to step recipes with pluginChain[] | Some workflows span multiple plugins | Pilot 3 recipes (e.g. FLEX, Sytrus, Harmor) |
| 6 | `DEEPER DIVES/<Plugin>/01-Learning/{Concepts,Quick-Reference}/*.md` | Educational content | Rewrite | Briefs / (Learning Path) | `sound-design-note` | Feeds explanations & comparisons | Density/tone inconsistent | Define Learning Path grouping |
| 7 | `DEEPER DIVES/fl-studio-online-manual-plugin-pages.md` | Official-manual link index | Keep | (cross-cutting) | `source-reference` | Primary evidence anchor for most records | Links may rot | Snapshot/retrievedAt on each |
| 8 | `DEEPER DIVES/deep-research-plugins-1..14.txt` + `genre-specific-plugin-research.md` | Raw research | Archive | Review | `source-reference` / `sound-design-note` | Use as evidence, cite; don't ship verbatim | Unverified claims | Triage per claim during Review |
| 9 | `DEEPER DIVES/<Plugin>/FL Studio Master Hub - Plugin Page Setup/*` (HTML/CSS/JS) | Legacy web page setup | Ignore | — | — | Web, desktop-first, off-brand | — | None |
| 10 | `DEEPER DIVES/*SUMMARY*.md`, `BATCH_*`, `*EXECUTION_PLAN*`, `STANDARDIZATION-GUIDE.md`, `AGENTS/GEMINI/QWEN.md` | Process/meta docs | Ignore (retain in source) | — | — | Process history only | — | None |
| 11 | `DEEPER DIVES/*.png` (hub nav/dashboard mockups) | Legacy UI mockups | Archive | — | — | Historical reference; off-brand | — | None |
| 12 | `FL-Studio-Master-Hub/src/data/plugins/**` (manifest.json + modular data) | Structured plugin data model | Rewrite (idea) | Vault | `plugin-record` | Adopt the *pattern* (manifest→enriched→index); re-map fields to Tonary schema | Coupled to Next.js types | Design seed pipeline (`architecture/content-knowledge-base.md`) |
| 13 | `FL-Studio-Master-Hub/scripts/aggregate-plugin-data.js` | Aggregation pipeline | Rewrite (idea) | (build tooling) | — | Reimplement as a Dart/CI seed builder → bundled JSON | Node-only today | Spec the Flutter seed builder |
| 14 | `FL-Studio-Master-Hub/**` (Next.js code, tailwind, GSAP, chart.js, purple theme) | Web app code + theme | Ignore | — | — | Hard pivot to Flutter; off-brand | — | None |
| 15 | `Tonary Brand Kit/**` (tokens css/json, Notion pages, CSVs, swatch svg) | Brand system | Keep | (design system) | — | Adopt into `.claude/brand/` now, `lib/design_system/tokens/` later | CSS/web tokens → need Flutter mapping | Map tokens → `ThemeData` |
| 16 | `Project - FL Studio Plugin/.archive/**` | Superseded plugin copies | Archive | — | — | Fallback only if primary source missing a plugin | Stale duplicates | None unless gap found |

## Target schema quick reference
`plugin-record` · `preset-record` · `workflow-recipe` · `sound-design-note` · `source-reference` · `comparison-brief` (Briefs comparisons) · `learning-path` (grouped Briefs/Flow) · `user-saved-item`. See `.claude/schemas/`.

## Migration log
- **2026-07-02 — Pilot batch 1 (seedVersion 2). ✅ DONE.** Migrated **FLEX, Sytrus, Fruity Parametric EQ 2** from DEEPER DIVES into `Tonary.io/assets/seed/`: 3 Plugin Records, 3 Preset Records (illustrative params, labeled), 3 Workflow Recipes, 5 Sound Design Notes, 6 Source References (official manual + DEEPER DIVES research corpus). Validated by `SeedValidator` (fail-closed) and an in-memory SQLite integration test. Publishing still gated on OQ-12 (licensing).
  - Next batches: expand from the priority list (Harmor, Maximus, Patcher, Edison, Slicex, Vocodex, Gross Beat, Newtone, DirectWave) once the licensing question clears.
- **2026-07-02 — Harmor candidate STAGED (not shipped).** Re-keyed Harmor from DEEPER DIVES into schema-shaped JSON at [`migration-staging/harmor/`](migration-staging/harmor/): 1 Plugin Record, 3 Sound Design Notes, 2 Source References (presets deferred per content-policy §3). Rephrased-not-reproduced, all cited, passes the real `SeedValidator` (`test/data/harmor_candidate_validation_test.dart`) and the gate #4 legal-content checklist. **Held out of `assets/seed/` pending OQ-12 gate #5 sign-off** — see the staging README. This proves the post-legal migration path end-to-end without publishing.

## Recommended migration sequence
1. **Pilot vertical slice** — ✅ DONE 2026-07-02 (see Migration log). FLEX, Sytrus, Fruity Parametric EQ 2 each taken through `plugin-record` → `preset-record`s → `workflow-recipe`s → `source-reference`s. Schemas proven end-to-end.
2. **Build the seed pipeline** (row 12–13) so migration is repeatable, not manual.
3. **Completeness audit** across all ~190 plugin folders; only seed verified records.
4. **Legal/attribution pass** on manual-derived content and preset reproduction (see risks).

## Guardrails (do not skip)
- Never bulk-import unreviewed content. Never fabricate parameter values or citations.
- Discard legacy web/theme artifacts (rows 9–11, 14).
- Do not modify the source folders. Migration writes only into `Tonary.io/`.

## Open Questions
- **Open Question:** Legal basis for reproducing FL Studio manual-derived parameter data and factory-preset descriptions? (Blocking for publishing Vault.)
- **Open Question:** Which fields are canonical when legacy `manifest.json` and DEEPER DIVES prose disagree? (Recommendation: manual > manifest > prose; record the winner's source.)
