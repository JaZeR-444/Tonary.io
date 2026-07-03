# QA Rules — Gates Before "Done"

> Scope: The gates every change passes before it is reported complete. Inherits [global-rules.md](global-rules.md).
> `/qa-pass` and `review-mobile-ui` enforce these together with [brand-rules.md](brand-rules.md).

A change is **not done** until every applicable gate below passes. If a gate can't be verified, the change is not done — say so.

## Gate 1 — Files exist and are non-empty
- Every file claimed to be created/edited **actually exists** on disk at the stated path.
- No empty files, no lorem ipsum, no bare "TODO" stubs shipped as if complete.
- **Never report success unless verified.** Prefer to check the filesystem over trusting intent (see [global-rules.md](global-rules.md) directive 6).

## Gate 2 — No fabricated data
- No invented plugin data, parameter values, presets, capabilities, sources, or facts (see [data-modeling-rules.md](data-modeling-rules.md)).
- Every factual record carries a **Source Reference**; unknowns are flagged/absent, never guessed.
- Migrated content was reviewed and classified, not bulk-imported (see [content-migration-rules.md](content-migration-rules.md)).

## Gate 3 — Accessibility
- Text contrast ≥ 4.5:1 (large ≥ 3:1); non-text ≥ 3:1. Visible focus on all interactive elements.
- Reduced motion honored (`MediaQuery.disableAnimations`). No meaning by color alone.
- Tap targets ≥ 48dp; dynamic text scale to 1.3× without clipping; icon-only controls have `Semantics` labels. See [ui-ux-rules.md](ui-ux-rules.md).

## Gate 4 — Brand compliance
- Passes the code-review guardrail checklist in [brand-rules.md](brand-rules.md): color law, amber-not-decoration,
  light labels on the violet brand fill, `outline-control` usage, naming, voice.
- No hardcoded hex; tokens only. Display face reserved for H1–H3/hero.

## Gate 5 — Build passes
- `flutter analyze` is clean (lints treated as errors). Code generation (freezed/json/riverpod) is up to date.
- `flutter build` succeeds for the targeted platform(s). No committed analyzer warnings.

## Gate 6 — Tests for new logic
- New business logic (notifiers, use-cases, repositories, mappers, validators) has unit tests.
- Seed/schema validators are tested against known-good and known-bad fixtures.
- Widget tests cover the required states where practical: loading, empty, error, populated (see [ui-ux-rules.md](ui-ux-rules.md)).
- Recommendation: keep tests fast and deterministic; no network in unit tests (offline-first makes this natural).

## Gate 7 — Verification before claiming done
- The person/agent reporting completion has actually run the relevant checks (analyze, build, tests, file existence).
- Claims are specific: what was changed, what was verified, what remains. No "should work" hand-waving.
- Anything unverifiable is labeled `Open Question:` rather than asserted as passing.

## Mobile-first sanity (spot check)
- Renders correctly at 360–430pt widths; primary action thumb-reachable; bottom nav intact; safe areas respected. See [mobile-first-rules.md](mobile-first-rules.md).
- Screens render meaningful offline state (no network-blocked blank screens).

## Reviewer output
- Report pass/fail per gate. On any fail, the change does not merge and is not called done.
