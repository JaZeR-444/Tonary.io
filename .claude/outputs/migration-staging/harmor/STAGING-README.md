# Harmor — Staged Migration Candidate (NOT shipped)

> **Status:** Reviewed & schema-valid, **staged** — deliberately kept OUT of `assets/seed/` so nothing
> publishes before the OQ-12 gate #5 sign-off. Governed by
> [`../../../rules/content-policy.md`](../../../rules/content-policy.md) and
> [`../../../rules/content-migration-rules.md`](../../../rules/content-migration-rules.md).
> Prepared 2026-07-02.

## What's here
Re-keyed from `docs/2026 — FL Studio Plugin ~ DEEPER DIVES/Harmor/` (02-Data specs tagged `[SRC: IL-MAN]`),
rephrased into Tonary's own words and cited:
- `plugins.json` — 1 Plugin Record (`harmor`).
- `sound_design_notes.json` — 3 Sound Design Notes (additive engines, resynthesis, Prism), each cited.
- `source_references.json` — 2 Source References (official manual + DEEPER DIVES research).

**Deliberately deferred:** Preset Records. Per content-policy §3 (no preset files / no factory-value dumps),
preset reproduction is the highest-risk item and stays out until the gate #5 sign-off — and even then, only as
original technique recipes, never IL factory patches.

## Gate #4 — legal-content check (per-batch pre-publish)
- [x] **No verbatim/near-verbatim manual text.** README prose ("most powerful synth ever…") was NOT copied;
      descriptions/notes are re-authored from the underlying facts.
- [x] **Every record cites a `sourceRef`.** Plugin + all 3 notes carry sources; validated by
      `SeedValidator` (see `test/data/harmor_candidate_validation_test.dart`).
- [x] **No preset files / no exact factory-value dumps.** Preset records deferred entirely.
- [x] **No fabricated values.** Every stated fact (516 partials, dual engine, resynthesis formats, ±12 st
      formant, Prism 0–100% / Low·Full·Band) traces to the manual-sourced specs. `tier: Premium` reflects
      Harmor's paid status (cross-checked, cited to the dive source).
- [x] **Sources permit derivation / official preferred.** Official manual is primary; the dive corpus is cited
      as `original-research`, re-authored not reproduced.
- [x] **Non-affiliation disclaimer present in the build.** Shipped in Settings ▸ About.

## Gate #5 — human sign-off
🔴 **Pending.** This candidate is one sign-off away from shipping.

## How to promote (after sign-off)
Merge each staged array into the matching `assets/seed/*.json`, bump `kSeedVersion` in
`lib/app/bootstrap/bootstrap.dart`, and run the full seed validator + integration tests. The staged files here
are shaped identically to the seed, so promotion is a straight append.
