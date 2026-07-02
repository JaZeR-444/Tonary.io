# Content Migration Rules

> Scope: Discipline for migrating legacy DEEPER DIVES plugin content into Tonary.
> Inherits [global-rules.md](global-rules.md). Schema conventions in [data-modeling-rules.md](data-modeling-rules.md).
> The migration map is authored at [../outputs/migration-map.md](../outputs/migration-map.md).

## Core principle
Legacy plugin content is **strategic source material, not a direct app blueprint.** Start with a migration
**map**, not a bulk import. Nothing enters Tonary until it has been reviewed and classified.

## Keep / Rewrite / Archive / Ignore
Classify every source item into exactly one bucket in [../outputs/migration-map.md](../outputs/migration-map.md):

| Bucket | Meaning | Examples |
| --- | --- | --- |
| **Keep** | Factual, accurate, still true — migrate as data with its source. | Verified plugin parameters/presets JSON, official-manual facts. |
| **Rewrite** | Useful substance, wrong form/voice — rework to Tonary schema + voice. | Learning concepts, workflow write-ups needing Tonary framing. |
| **Archive** | Not for the app now, but worth preserving offline. | Deep historical notes, superseded drafts. |
| **Ignore / Discard** | Legacy web cruft or off-brand — never migrate. | See discard list below. |

## Discard list (never migrate)
- Legacy web page-setup assets: **HTML / CSS / JS** "Plugin Page Setup" files.
- The **purple glassmorphism / "Deep Space Cyberpunk"** theme and any of its styling.
- **Next.js / React / Tailwind / Chart.js / GSAP** component code and web architecture.
- OS/desktop artifacts: `.ico` files, `desktop.ini`, thumbnail caches.
- **Batch / session-summary meta-files** and process logs from the legacy workflow.

## What to preserve
- **Factual plugin data**: parameters, preset definitions, capabilities, categories, tiers/types — as data, not prose.
- **Legacy content structure as a guide** (not to copy verbatim): each plugin folder held
  `00-START-HERE.md`, `MASTER-INDEX.md`, `README.md`, `01-Learning/{Concepts,Quick-Reference}`,
  `02-Data/{parameters,presets,rules}` (JSON), `03-Workflows/{by-goal,by-instrument}`, `04-Reference/technical-docs`.
  The `02-Data` JSON is the richest migration target; the web "Plugin Page Setup" is discard.
- Scale context: ~190 plugin folders exist; ~98 were standardized. Do not assume the other folders are complete or correct.

## Source attribution
- Every migrated fact carries a **Source Reference** (see [data-modeling-rules.md](data-modeling-rules.md)).
- **Attribute official-manual sources explicitly.** Prefer manufacturer/official docs over legacy prose when they conflict.
- If a legacy claim has no traceable source, it is Rewrite-pending-verification or Ignore — never Keep as fact.

## Never bulk-import unreviewed
- No script dumps a folder of legacy JSON straight into the seed dataset. Each record is reviewed, re-keyed to the
  Tonary schema (kebab ids, camelCase keys), validated, and sourced **before** it ships.
- Never fabricate to fill gaps during migration. Missing data stays missing and flagged (see [data-modeling-rules.md](data-modeling-rules.md)).
- Never overwrite already-migrated, reviewed Tonary records with a fresh unreviewed legacy pass. Inspect and merge.

## Process order
1. Inventory sources → 2. Classify each into the map → 3. Rewrite/re-key Keep+Rewrite items to schema →
4. Attach Source References → 5. Validate → 6. Seed. Track status per item in [../outputs/migration-map.md](../outputs/migration-map.md).

Open Question: Is there a definitive list of which of the ~98 standardized folders are source-verified vs. draft?
Recommendation: Treat "standardized" as form-complete, not fact-verified; require an explicit source check before Keep.
