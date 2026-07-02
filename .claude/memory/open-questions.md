# Open Questions — Tonary.io

> Unresolved decisions. Each should be closed by a user decision or investigation, then moved to
> `decisions.md`. Do not silently guess an answer — flag it here and proceed with the labeled recommendation.

## Product & scope
- **OQ-01 — MVP module set.** ✅ RESOLVED 2026-07-02 → **[D-011]**. Vault + Briefs + basic Scout + search + onboarding + settings; Review/Flow deferred. (`../project/mvp-scope.md`)
- **OQ-02 — Monetization / premium tier.** Legacy data uses Free/Premium plugin tiers; is Tonary itself free, paid, or freemium? Affects onboarding, gating, store setup.
- **OQ-03 — Accounts & cloud sync at what phase?** Offline-first local DB is Phase 1; when do accounts/sync arrive? (`../project/roadmap.md`)

## Architecture
- **OQ-04 — State/data stack lock.** ✅ RESOLVED 2026-07-02 → **[D-010]**. Riverpod + go_router + Drift + freezed. (`../architecture/`)
- **OQ-05 — AI provider for Scout/Briefs.** ✅ RESOLVED 2026-07-02 → **[D-012]**. Claude API via server proxy, retrieval-first, keys never in-app. (`../architecture/ai-assistant-architecture.md`)
- **OQ-05b — AI backend hosting.** OPEN. The proxy needs a host (serverless function? which platform?). Decide before Scout/Briefs implementation, not before scaffold.
- **OQ-06 — Seed pipeline implementation.** Dart-based build step vs external script producing bundled JSON? (`../architecture/content-knowledge-base.md`, migration-map rows 12–13)

## Content & data
- **OQ-07 — Plugin data completeness/accuracy.** ~190 folders, ~98 standardized, many partial. A completeness audit is required before seeding. (`../outputs/migration-map.md`)
- **OQ-08 — Canonical-field precedence** when legacy `manifest.json` and DEEPER DIVES prose disagree. Recommendation: manual > manifest > prose, record the source.
- **OQ-09 — Scope of plugin coverage at launch.** All FL stock plugins, or the flagship/priority set first? Recommendation: pilot FLEX/Sytrus/Fruity Parametric EQ 2, then priority list.

## Design system
- **OQ-13 — Font bundling.** The scaffold declares `Inter` / `Space Grotesk` / `IBM Plex Mono` by family name but the font files are **not bundled yet**, so the app currently falls back to the platform default. Bundle the `.ttf`s under `assets/fonts/` (+ `pubspec.yaml` `fonts:`) or add `google_fonts`. Recommendation: bundle for offline-first (no network font fetch). Decide before design-system polish.

## Brand & platform
- **OQ-10 — Bundle/package id.** ✅ RESOLVED 2026-07-02 → **[D-013]** `io.tonary.app`. Store *listing* names still TBD (must respect naming rules — not `TONARY.wav`).
- **OQ-11 — Flutter token mapping.** How faithfully to translate web CSS tokens into `ThemeData` + theme extensions; any values needing tuning for mobile OLED. (`../brand/visual-direction.md`)

## Legal (blocking — see `known-risks.md`)
- **OQ-12 — Licensing/attribution** for FL Studio manual-derived content and factory-preset reproduction. Blocks publishing Vault. Decision brief: [`../outputs/oq-12-licensing-decision-brief.md`](../outputs/oq-12-licensing-decision-brief.md) — resolves to one call: self-accept the conservative content policy for an initial release, or route to counsel first.
