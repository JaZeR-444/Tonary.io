# Workflow — Release Prep (Mobile)

Prepare a Tonary mobile release: versioning, changelog, store metadata, QA pass, and builds for both platforms.

Related: [qa-review-workflow.md](qa-review-workflow.md) · [../agents/product-architect.md](../agents/product-architect.md) · [../agents/brand-systems-designer.md](../agents/brand-systems-designer.md) · [../rules/naming-rules.md](../rules/naming-rules.md) · [../commands/prep-release.md](../commands/prep-release.md)

## Purpose
Cut a clean, on-brand release with correct versioning, an accurate changelog, and compliant store listings — gated by QA.

## When to use
When a milestone is ready to ship to TestFlight / Play internal testing or production.

## Inputs
- Target version and the merged change set since last release.
- Store metadata source (naming rules, brand voice).
- Signing config for iOS and Android.

## Steps
1. **Version.** Bump `pubspec.yaml` `version: X.Y.Z+build` (SemVer + monotonic build number). Confirm the bump matches scope (patch/minor/major) with product-architect.
2. **Changelog.** Generate from merged PRs using the changelog template; group by module (Scout/Vault/Review/Flow/Briefs) and Added/Changed/Fixed. Convert relative dates to absolute (today 2026-07-02).
3. **Store metadata.** App name = **Tonary** (never `TONARY.wav`, never FL Studio terms). Verify title, subtitle, description, keywords, screenshots follow naming + brand voice. `TONARY.wav` only allowed as hero/campaign styling in marketing art, not the listing name.
4. **QA pass.** Run full [qa-review-workflow.md](qa-review-workflow.md) on the release candidate; all gates must be PASS.
5. **Build both platforms.** `flutter build ipa` (iOS) and `flutter build appbundle` (Android) release mode; verify signing and that the offline seed dataset is bundled.
6. **Smoke test builds.** Install on a real device per platform; launch, load Vault offline, exercise one Scout/Briefs flow.
7. **Tag & record.** Git tag `vX.Y.Z`; attach changelog and build artifacts.

## Output / report format
```
Release: vX.Y.Z (+build)  Date: 2026-07-02
Changelog: <link>  Modules touched: <…>
Store metadata: name=Tonary — checked PASS/FLAG
QA gate: PASS (link)  — release blocked if not PASS
Builds: iOS ipa <ok/fail>  Android aab <ok/fail>
Device smoke test: <device> PASS/FAIL
Tag: vX.Y.Z  Open Questions: <list>
```

## Guardrails
- No release ships without a PASS from the QA workflow.
- Product/store name is **Tonary** — enforce naming rules; `TONARY.wav` never appears as the app/package/listing name.
- Do not ship without the bundled offline seed dataset (offline-first is mandatory).
- Version/build numbers never move backward; never reuse a build number.
- Recommendation: automate steps 1–2 and 5 in CI once release cadence stabilizes.
