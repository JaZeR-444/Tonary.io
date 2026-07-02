# Naming Rules (HARD)

> Scope: What Tonary is called — product, project, hero styling, modules, package ids.
> These are hard rules. Violations are a brand and legal risk. See also [ui-language.md](ui-language.md).

## The name

| Form | When to use | Rule |
| --- | --- | --- |
| **Tonary** | Official product / app name | The durable software product name. Store listing, legal, system, splash. |
| **Tonary.io** | Project / web identity | Domain and project-level identity. Marketing site, repo, docs cover. |
| **TONARY.wav** | HERO / campaign styling **only** | Splash art, social teasers, empty-state easter eggs. **Never** the app name, package name, or store listing. |

Why: `Tonary.wav` as an official name reads as a file/asset, not a durable product. Extension styling in every
label creates typing burden and UI noise. Keep the product name clean; use `.wav` styling as occasional hero flair.

## Module names (the only official modules)
Always "Tonary X" on first/formal reference; the bare module word is fine in-app once context is set.

| Module | Purpose |
| --- | --- |
| **Tonary Scout** | AI recommendations; plugin/preset/chain matching |
| **Tonary Vault** | Curated plugin, preset, chain & parameter records |
| **Tonary Review** | Source review + evidence-backed notes |
| **Tonary Flow** | Workflow recipes, setup paths, sound-design playbooks |
| **Tonary Briefs** | Fast explanations, comparisons, next-step suggestions |

Do not invent new top-level module names without updating this file and the brief.

## Forbidden: FL Studio interface terms as Tonary branding
FL Studio is a **third-party platform context**, not Tonary-owned branding. Never adopt Image-Line's
interface names as Tonary product/module/screen names:

- Banned as Tonary names: **Browser, Plugin Database, Channel Rack, Mixer, Playlist, Piano Roll**.
- Correct: use Tonary's own vocabulary — Vault (not "Plugin Database"), Scout (not "Browser").
- FL Studio may be **referenced** as context ("works with your FL Studio plugins"), but its UI terms never
  become Tonary-owned labels. Tonary is not affiliated with, nor endorsed by, Image-Line.

## Package / bundle identifier
Recommendation: Use a reverse-DNS id off the `.io` identity:
- Bundle/application id: **`io.tonary.app`** (iOS bundle id + Android applicationId).
- Dart package name: `tonary` (pubspec `name: tonary`).
- Keep the id stable forever; it cannot change post-launch without breaking installs. Never encode `.wav` in it.

Open Question: Do sub-products ever need their own store presence? If so, suffix under the same root
(e.g. `io.tonary.app` stays the single app; modules are features, not separate bundle ids). Recommendation: one bundle, feature modules.

## Casing
- Product: `Tonary` (title case). Project: `Tonary.io`. Hero: `TONARY.wav` (all caps, only in hero contexts).
- Module display: `Tonary Scout`. Feature-folder code: `scout/` lowercase (see [../rules/flutter-rules.md](../rules/flutter-rules.md)).
