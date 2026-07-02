# Tonary — Terminology & Glossary

> Canonical vocabulary. Use these terms exactly. When in doubt, match this file.
> Related: [product-principles.md](product-principles.md) · [mvp-scope.md](mvp-scope.md) · [roadmap.md](roadmap.md)

## Brand & Identity
| Term | Meaning | Rule |
|---|---|---|
| **Tonary** | Official app / product name. | Always use for the app itself. |
| **Tonary.io** | Project / web identity. | Use for domain / web presence. |
| **TONARY.wav** | Optional hero / campaign styling. | Marketing ONLY. Never the app name, package name, or store listing. |

## Official Modules (the only five)
| Module | Definition |
|---|---|
| **Tonary Scout** | AI recommendations; plugin/preset/chain matching. |
| **Tonary Vault** | Curated plugin, preset, chain & parameter records. |
| **Tonary Review** | Source review + evidence-backed notes. |
| **Tonary Flow** | Workflow recipes, setup paths, sound-design playbooks. |
| **Tonary Briefs** | Fast explanations, comparisons, next-step suggestions. |

## Tonary Data Schemas (target)
Plugin Record · Preset Record · Workflow Recipe · Sound Design Note · Source Reference · Comparison Brief · Learning Path · User Saved Item.
_Legacy manifest fields mapped into these: id (kebab-case), name, category, tier (Free/Premium), type (Generator/Effect), description, tags[], capabilities[], version, color._

## Product Concepts
| Term | Meaning |
|---|---|
| **Sound-design intelligence layer** | Tonary's category — organizes/compares/recalls/applies plugin knowledge; not a DAW, not a database, not a chatbot. |
| **Offline-first** | Core value works with no network (Drift/SQLite + bundled seed JSON). |
| **Mobile-first** | Designed for phone portrait first; tablet is an adaptation. |
| **Dark-first** | Dark is the default and primary theme. |
| **Seed dataset** | Bundled curated JSON records shipped with the app. |

## FL Studio Terms — Third-Party Context ONLY
FL Studio is the platform our users produce on. Reference these to describe user context, **never** as Tonary-owned product/module/feature names.
- FL Studio, Image-Line (the vendor — Tonary is not affiliated).
- Browser, Plugin Database, Channel Rack, Mixer, Playlist — FL Studio interface terms. Contextual reference only.
- Generator / Effect — plugin `type` values (used as data, from source manifests).

## Banned as Tonary Branding
Do **not** use these as Tonary product, module, or feature names:
- **Browser, Plugin Database, Channel Rack, Mixer, Playlist** (FL Studio UI terms).
- **Master Hub / FL Studio Master Hub** (the legacy web product — Tonary is a hard pivot, not a rebrand).
- **Deep Space Cyberpunk / purple glassmorphism** (legacy web theme — discarded).
- Generic labels like "wiki," "database app," or "AI chatbot" as the product's identity.

`Open Question:` Confirm preferred casing for module references in UI — "Tonary Vault" vs. just "Vault" once inside the app. `Recommendation:` full "Tonary <Module>" in marketing/onboarding; short "<Module>" in-app nav.
