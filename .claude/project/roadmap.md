# Tonary — Roadmap

> Phased plan. Today's anchor date: **2026-07-02**. Windows are estimates (`Recommendation:`), not commitments.
> Related: [mvp-scope.md](mvp-scope.md) · [product-principles.md](product-principles.md) · [terminology.md](terminology.md)

## Phase 0 — Foundation (DONE, through ~2026-06-30)
Baseline the app so features can land cleanly.
- Flutter scaffold (iOS + Android), mobile-first, offline-first.
- Design system: dark-first tokens (colors, typography, spacing, motion) in `lib/design_system/`.
- Architecture: Riverpod, go_router, Drift (SQLite) + bundled seed JSON. `lib/` structure established.
- `.claude` framework: templates + project docs (this set).

## Phase 1 — MVP (target ~2026-07-02 → 2026-09-30)
Ship the core offline loop. Scope from [mvp-scope.md](mvp-scope.md).
- **Vault:** curated Plugin/Preset/Chain/Parameter records + detail views + saved items.
- **Briefs:** curated explanations, comparisons, next-step suggestions.
- **Scout (basic):** transparent rule/tag matching over Vault.
- **Search, Onboarding, Settings.**
- Exit criteria: MVP Acceptance in [mvp-scope.md](mvp-scope.md) all green; QA verdict PASS.

## Phase 2 — Scout AI + Flow (target ~2026-10-01 → 2026-12-31)
Deepen intelligence and add applied workflow.
- **Scout AI:** learned/semantic ranking and matching beyond rules; still assistant-only-when-it-helps.
- **Flow:** workflow recipes, setup paths, sound-design playbooks as an interactive module.
- Expand seed dataset toward the ~98 standardized plugin folders (curated, not bulk).

## Phase 3 — Review + Collections + Sync (target ~2027-01-01 → 2027-03-31)
Trust, organization, and multi-device.
- **Review:** source review + evidence-backed note authoring (annotate, cite, verify).
- **Collections:** user-organized groupings of records.
- **Sync:** optional account + cloud sync across devices (offline-first preserved).

## Cross-Cutting (ongoing)
- Accessibility, performance, and brand/color-law audits every phase.
- Migration of legacy source material via [migration-plan-template.md](../templates/migration-plan-template.md) — map, don't bulk-import.

## Open Questions
- `Open Question:` Does Sync (Phase 3) require introducing accounts earlier for collections?
- `Open Question:` Is Flow (Phase 2) or Review (Phase 3) higher user priority — validate with Phase 1 feedback.
- `Open Question:` Monetization tier boundaries (Free/Premium) — where do they map onto modules?
- `Open Question:` Are Phase windows realistic for team size? Revisit after Phase 1 velocity is known.
