# Tonary — MVP Scope

> The smallest release that delivers real, trustworthy value on mobile, offline.
> Related: [roadmap.md](roadmap.md) · [product-principles.md](product-principles.md) · [target-user.md](target-user.md)

## MVP Thesis
Ship a premium, dark-first, offline-first mobile app that lets an FL Studio producer **organize, browse, understand, and recall** curated plugin knowledge — without depending on AI or the cloud for the core loop.

## Modules That Ship First (Confirmed — [D-011], 2026-07-02)
| Module | In MVP? | What ships |
|---|---|---|
| **Tonary Vault** | ✅ Yes | Curated Plugin, Preset, Chain & Parameter records; detail views; save/favorite (User Saved Item). |
| **Tonary Briefs** | ✅ Yes | Fast explanations, side-by-side comparisons, next-step suggestions (static/curated, no AI required). |
| **Tonary Scout** | ✅ Basic | Rule/tag-based recommendations & matching over Vault data. Full AI ranking deferred. |
| **Search** | ✅ Yes | Fast local search across Vault records (name, tags, category, tier, type). |
| **Onboarding** | ✅ Yes | First-run intro, offline data seed, quick personalization. |
| **Settings** | ✅ Yes | Theme (dark default), data/seed management, about, accessibility toggles. |
| **Tonary Review** | ⏳ Delayed | See Delayed below. |
| **Tonary Flow** | ⏳ Delayed | See Delayed below. |

## Explicitly Delayed (labeled)
- **Tonary Review (DELAYED → Phase 3):** source review + evidence-backed note authoring UI. MVP shows *existing* sourced facts but no in-app review/annotation workflow.
- **Tonary Flow (DELAYED → Phase 2):** workflow recipes / setup paths / playbooks as an interactive module.
- **Full Scout AI (DELAYED → Phase 2):** learned ranking, semantic matching. MVP uses transparent rule/tag matching only.
- **Cloud sync & collections (DELAYED → Phase 3):** MVP is single-device, offline-first; no account required.

## Foundations Assumed Complete (Phase 0)
Flutter scaffold, design-system tokens, and the confirmed stack — **Riverpod, go_router, Drift (SQLite) + bundled seed JSON, freezed** ([D-010]). Bundle id `io.tonary.app` ([D-013]). See [roadmap.md](roadmap.md).

## AI in the MVP (Confirmed — [D-012])
Basic Scout/Briefs use **retrieval-first** matching over Vault records. Any generative step routes **App → server proxy → Claude API** with **evidence-backed, cited** answers; API keys are never shipped in-app. Backend host is still open (`../memory/open-questions.md` OQ-05b) — not blocking the scaffold or the offline core loop.

## MVP Acceptance
- [ ] App runs fully offline (network OFF) for Vault, Briefs, basic Scout, Search, Settings.
- [ ] Curated seed dataset loads; no fabricated plugin facts (`Open Question:` records flagged, not invented).
- [ ] Dark-first tokens + color law enforced; passes [qa-report](../templates/qa-report-template.md) brand/accessibility checks.
- [ ] Onboarding completes in under ~60s; core recall task achievable in seconds.
- [ ] Golden tests lock key screens at 390px in dark theme.

## Success Metrics
- **Activation:** % of new users who complete onboarding and save ≥1 item day one.
- **Recall speed:** median time from open → find a target record (target: < 10s).
- **Trust:** qualitative — users act on Vault records without re-checking elsewhere.
- **Retention:** D7 return rate of activated users.

`Open Question:` How large is the seed dataset at launch — a curated subset (~a few dozen high-value plugins) or the ~98 standardized folders? `Recommendation:` launch with a curated subset, expand post-MVP.
