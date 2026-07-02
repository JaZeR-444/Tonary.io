# Tonary — Product Foundation

> The definitive answer to "what are we building and why." Read alongside
> `product-principles.md`, `target-user.md`, `mvp-scope.md`, and `../brand/`.

## What Tonary is
A premium, **mobile-first, dark-first sound-design intelligence layer** for FL Studio producers. It turns scattered plugin knowledge into something you can **organize, understand, compare, recall, and apply** from your phone — in the studio or on the go. It is opinionated and evidence-backed: answers cite their sources.

## What Tonary is NOT
- **Not** a rebrand of the legacy FL Studio Master Hub (that was a desktop-first Next.js web app with a purple glassmorphism theme).
- **Not** a generic plugin database, wiki, or manual mirror.
- **Not** an "AI chatbot" — assistant language appears only when it helps the user's next action.
- **Not** a DAW, audio processor, or Image-Line product. FL Studio is a third-party platform Tonary supports; it is not Tonary-owned branding.

## Who it is for
FL Studio producers, beatmakers, sound designers, and plugin-heavy creators — from ambitious beginners to working pros — who use their phone as a companion to their studio. See personas in `target-user.md`.

## The problem it solves
Plugin knowledge is fragmented across manuals, videos, forum posts, and memory. Producers lose momentum context-switching to look things up, can't quickly compare options, and forget hard-won settings. Tonary concentrates that knowledge into fast, trustworthy, recallable records and briefs — reducing the tax between "I have an idea" and "I know which tool/preset/chain to reach for."

## How it differs from the old FL Studio Master Hub
| | Legacy FL Studio Master Hub | Tonary |
|---|---|---|
| Platform | Desktop-first web (Next.js, static export) | Mobile-first Flutter (iOS + Android), offline-first |
| Identity | "Deep Space Cyberpunk" purple glassmorphism | Restrained dark-first amber/cyan brand |
| Framing | Plugin *database / hub* | Sound-design *intelligence layer* |
| AI | Bolt-on assistant section | Grounded, evidence-backed Scout/Briefs woven into recall |
| Content stance | Aggregate everything | Curated, cited, source-not-blueprint |
| Structure | Feature sections in one hub page | Modules: Scout, Vault, Review, Flow, Briefs |

The legacy app's **modular plugin data model** is the one idea worth carrying (as a pattern, re-mapped to Tonary schemas) — see `../outputs/migration-map.md`.

## The mobile-first experience should prioritize
1. **Fast recall** — find a plugin/preset/chain and its key settings in seconds, thumb-only.
2. **Trust** — every claim traceable to a Source Reference.
3. **Comparison** — "X vs Y for this job," with a clear recommendation (Briefs).
4. **Offline** — core browse/recall works with zero connectivity.
5. **Restraint** — dense information rendered calm and legible, never noisy.

## What data / content powers the product
Curated **Tonary records** migrated (not copied) from the DEEPER DIVES corpus and re-mapped from the legacy modular data model, seeded into a local DB from bundled JSON. Record types: Plugin, Preset, Workflow Recipe, Sound Design Note, Source Reference, plus Comparison Brief / Learning Path / User Saved Item. Schemas: `../schemas/`.

## Initial MVP (see `mvp-scope.md` for detail)
**Recommendation:** ship **Vault** (browse/recall plugin & preset records) + **Briefs** (explanations/comparisons) + a basic **Scout** (matching/recommendations) + global **search** + **onboarding** + **settings**. Deliberately delayed: full **Review** authoring, **Flow** recipe builder, collections, cloud sync.

## What should be delayed
- Cloud sync / accounts (offline-first local DB first).
- User-generated content and community features.
- Advanced Scout generative features requiring a backend (start retrieval-first).
- Light theme (not required at launch per brand kit).

## How Tonary should talk, look, and feel
- **Talk:** precise, calm, technical. Verbs like *index, review, compare, cite, retrieve, route*. Lead with "indexed sound-design intelligence," not "AI." Alerts say what happened, why it matters, and what to do next. (`../brand/voice-and-tone.md`)
- **Look:** dark-first, studio-native, restrained. Amber owns brand action; cyan owns focus/system; green affirmative; violet creative; red exceptional. Stroke-first iconography, no music-note clichés or neon glow. (`../brand/visual-direction.md`, `../brand/brand-rules.md`)
- **Feel:** premium, trustworthy, quick. Tight functional motion, honors reduced-motion. Never flattens the creative process — it accelerates decisions and preserves the producer's judgment.
