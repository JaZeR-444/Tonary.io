# Seed dataset (seedVersion 3 — first content release)

The curated, reviewed dataset migrated from the `2026 — FL Studio Plugin ~ DEEPER DIVES`
research corpus per `.claude/commands/migrate-content.md`. **30 plugins**: the pilot
(FLEX, Sytrus, Fruity Parametric EQ 2) plus 27 promoted from staging on 2026-07-02.

- Plugin identities and behaviors are factual, cited to the official FL Studio manual
  and the DEEPER DIVES research corpus (`source_references.json`).
- Descriptions and notes are **re-authored in Tonary's own words**, never reproduced
  from the manual, per `.claude/rules/content-policy.md`.
- Factory preset files / exact factory-value dumps are **not** included; preset params
  present are illustrative and labeled in their own `notes`/`tip` fields.
- Every record (except user data) carries a non-empty, resolvable `sources[]`.
- Governed by `.claude/rules/data-modeling-rules.md` (no fabrication) and validated at
  load by `SeedValidator` (fail closed).

**Publishing:** The owner authorized the initial content release under the conservative
content policy (OQ-12 gate #5, 2026-07-02); a non-affiliation disclaimer ships in
Settings ▸ About. Bump `kSeedVersion` in `bootstrap.dart` whenever these files change so
devices re-hydrate.

Further batches append directly here per `.claude/outputs/migration-map.md`.

Files (one per record type): `source_references.json`, `plugins.json`, `presets.json`,
`workflow_recipes.json`, `sound_design_notes.json`.
