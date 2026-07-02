# Migration Staging — reviewed candidates, NOT shipped

> Schema-valid, legally-checked plugin candidates re-keyed from `docs/…/DEEPER DIVES/`, held OUT of
> `assets/seed/` until the OQ-12 **gate #5** human sign-off. Governed by
> [`../../rules/content-policy.md`](../../rules/content-policy.md). Prepared 2026-07-02.
>
> Everything here is validated automatically by `test/data/staging_candidates_test.dart` (schema +
> referential integrity + no id collision with the shipped seed). Nothing here loads into the app.

## Candidates

| Candidate | Records | Presets | Gate #4 (legal-content) | Gate #5 (sign-off) |
|---|---|---|---|---|
| [`harmor/`](harmor/) | 1 plugin · 3 notes · 2 sources | deferred | ✅ pass (see [`harmor/STAGING-README.md`](harmor/STAGING-README.md)) | 🔴 pending |
| [`maximus/`](maximus/) | 1 plugin · 2 notes · 2 sources | deferred | ✅ pass | 🔴 pending |
| [`gross-beat/`](gross-beat/) | 1 plugin · 2 notes · 2 sources | deferred | ✅ pass | 🔴 pending |

## Gate #4 checklist (applies to every candidate above)
- No verbatim/near-verbatim manual text — all descriptions/notes re-authored from the underlying facts.
- Every record cites a `sourceRef`; validated by the staging test.
- **No preset files / no factory-value dumps** — preset records deferred entirely (Gross Beat's
  `factory-preset-map.json` was explicitly excluded).
- No fabricated values — every stated fact traces to the manual-sourced specs (`[SRC: IL-MAN]`).
- Official manual is the primary source; the DEEPER DIVES corpus is cited as `original-research`.
- Non-affiliation disclaimer ships in Settings ▸ About.

## Promotion (after gate #5 sign-off)
For each approved candidate, append its arrays into the matching `assets/seed/*.json`, bump
`kSeedVersion` in `lib/app/bootstrap/bootstrap.dart`, and run the full seed validator + integration
tests. Files here are shaped identically to the seed, so promotion is a straight append.
