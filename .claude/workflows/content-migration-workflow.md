# Workflow — Content Migration

Migrate a batch of legacy plugin content from **DEEPER DIVES** into Tonary schemas + offline seed data. Review → map → transform → validate → seed.

Related: [source-review-workflow.md](source-review-workflow.md) · [../agents/content-taxonomist.md](../agents/content-taxonomist.md) · [../rules/migration-rules.md](../rules/migration-rules.md) · [qa-review-workflow.md](qa-review-workflow.md) · [../commands/migrate-content.md](../commands/migrate-content.md)

## Purpose
Turn strategic source material into clean, deduplicated, cited Tonary records that seed the offline dataset — without fabricating facts.

## When to use
Populating **Tonary Vault** and related schemas from reviewed source folders, one batch (e.g. 5–15 plugins) at a time.

## Inputs
- A batch of sources already run through [source-review-workflow.md](source-review-workflow.md) (KEEP/REWRITE only).
- Target schemas: Plugin Record, Preset Record, Workflow Recipe, Sound Design Note, Source Reference, Comparison Brief, Learning Path, User Saved Item.
- Existing seed dataset + Drift schema.

## Steps
1. **Review confirm.** Verify each source has a keep/rewrite decision and a target schema in the migration map. Skip anything ARCHIVE/IGNORE.
2. **Map fields.** Legacy manifest → Plugin Record: `id` (kebab-case, keep stable), name, category, tier (Free/Premium), type (Generator/Effect), description, tags[], capabilities[], version, color. Presets/parameters JSON → Preset/Sound Design records. Workflows → Workflow Recipe.
3. **Transform.** Normalize categories/tags to the Tonary taxonomy; rewrite prose to Tonary voice; attach a **Source Reference** to every record (provenance is mandatory).
4. **Dedup.** Merge duplicate plugins/presets by `id`; reconcile conflicting fields by preferring the source with citable data; log merges.
5. **Validate.** Schema-check every record (required fields present, enums valid, ids unique/kebab-case, every fact traceable). Fail the batch on any unverifiable claim.
6. **Seed.** Write to the bundled seed JSON and load into Drift; run a smoke query to confirm records read back through the repository.
7. **QA + report.** Run relevant QA gates (no fabricated data is the key gate).

## Output / report format
```
Batch: <name/date>  Sources: <n>
Records created: Plugin <n> · Preset <n> · Workflow <n> · Note <n>
Dedup merges: <list of ids>
Validation: PASS/FAIL  Unverifiable claims: <list → Open Questions>
Seed: written to <path>, smoke query OK/FAIL
```

## Guardrails
- **Never fabricate** parameter values, presets, or capabilities. No source → `Open Question:`, not invented data.
- Every record carries a Source Reference; unsourced records do not ship.
- Preserve legacy `id` kebab-case for stable identity across migrations.
- Do not import legacy web page setups or theme metadata as content.
- Batch is atomic: if validation fails, fix or defer — do not partially seed.
