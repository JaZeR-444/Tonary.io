# Constraints — Tonary.io

> Hard boundaries that shape every decision. Violating these is a defect, not a preference.

## Product
- Mobile-first Flutter (iOS + Android). No desktop-first layouts.
- Offline-first: core browse/recall must work with zero connectivity.
- Premium, restrained, dark-first experience. Light theme not required at launch.
- Sound-design **intelligence layer** framing — not a plugin database, not a DAW.

## Brand (from Tonary Brand Kit — enforced in review)
- Dark-first surfaces; the amber/cyan/green/violet/red color law is fixed.
- Amber `#ffb13b` = brand action only, never general decoration.
- Bright-accent filled controls must use a **dark** label (`#07090a`).
- Use `outline-control #5a666c` for control borders / chart axes / focus-visible boundaries.
- Never convey meaning by color alone; `text-muted` is microcopy/placeholder only.
- Fonts: Inter (UI), Space Grotesk (display H1–H3/hero only), IBM Plex Mono (mono/IDs). Buttons ≥14px/600.
- Honor reduced-motion. Focus ring = two-layer cyan, never glow alone.

## Naming
- Tonary (official) / Tonary.io (project) / `TONARY.wav` (hero only).
- Modules limited to Scout/Vault/Review/Flow/Briefs.
- No FL Studio interface terms as Tonary branding. FL Studio = third-party context.
- **Recommendation:** bundle/package id `io.tonary.app` (confirm before store setup).

## Data & content
- Every record cites a Source Reference. No fabricated plugin data, presets, parameters, or citations.
- Migration is map-first, reviewed, and validated before seeding. No bulk import.
- Record ids kebab-case; JSON keys camelCase; source ids immutable.

## Engineering
- No new package dependency without justification (`../rules/flutter-rules.md`).
- Business logic out of widgets. Features never import each other. Data never imports presentation.
- Do not modify the sibling source folders. Do not overwrite useful work without inspecting it.
- Do not create empty placeholder files. Do not report success unless files exist and are non-empty.

## Legal / external (see `known-risks.md`)
- Attribution/licensing for FL Studio manual-derived content and factory-preset reproduction is **unresolved** and blocks publishing Vault data.
- API keys must never be embedded in the client.
