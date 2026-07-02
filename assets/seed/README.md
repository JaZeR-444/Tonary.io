# Seed dataset (PILOT MIGRATION — seedVersion 2)

The first reviewed slice of the curated dataset, migrated from the
`2026 — FL Studio Plugin ~ DEEPER DIVES` research corpus per
`.claude/commands/migrate-content.md`. Covers three plugins: **FLEX**, **Sytrus**,
and **Fruity Parametric EQ 2**.

- Plugin identities and behaviors are factual, cited to the official FL Studio
  manual and the DEEPER DIVES research corpus (`source_references.json`).
- Preset params and recipe tips are **illustrative** and labeled as such in their
  own `notes`/`tip` fields — they are not captured factory values.
- Every record (except user data) carries a non-empty, resolvable `sources[]`.
- Governed by `.claude/rules/data-modeling-rules.md` (no fabrication) and validated
  at load by `SeedValidator` (fail closed).

⚠️ **Publishing note:** shipping this data publicly is still gated on the content
licensing/attribution question (`.claude/memory/open-questions.md` OQ-12). It is
safe to bundle for local development. Bump `kSeedVersion` in `bootstrap.dart`
whenever these files change so devices re-hydrate.

Next migration batches: expand coverage per `.claude/outputs/migration-map.md`.

Files (one per record type): `source_references.json`, `plugins.json`,
`presets.json`, `workflow_recipes.json`, `sound_design_notes.json`.
