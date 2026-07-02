# CLAUDE.md — Tonary Operating Manual

This file is the primary operating manual for Claude Code when working in the **Tonary.io** project. Read it first, every session. It is deliberately concise; the deeper rules live under `.claude/` and are linked below.

---

## 1. Project identity

- **Official app/product name:** Tonary
- **Project / web identity:** Tonary.io
- **Hero styling only:** `TONARY.wav` (campaign/splash art only — never the app name, package name, or store listing)
- **Platform:** Mobile-first **Flutter** app (iOS + Android), offline-first
- **Status (2026-07-02):** Phase 0 foundation complete + first MVP features underway. The Flutter app is scaffolded and green (`flutter analyze` clean, all tests passing): app shell + go_router bottom nav, `design_system/` tokens, the Drift data layer with a validated bundled-seed pipeline, the **Vault** module (list → detail), **Search** (offline plugin search, reached from the Vault app bar), **Briefs** (offline side-by-side comparison of two plugins with evidence-backed notes + next-step recipes), and **Scout** (basic — transparent rule/tag recommendations over Vault records, showing why each matched; AI ranking deferred). Home/Settings are still placeholder screens; **Review/Flow** are deferred (see `.claude/project/mvp-scope.md`). Build new features against the existing `lib/` tree — do not re-scaffold.

## 2. Product purpose

Tonary is a premium, dark-first **sound-design intelligence layer** for FL Studio producers, beatmakers, sound designers, and plugin-heavy creators. It helps users **organize, understand, compare, recall, and apply** plugin / preset / workflow knowledge on mobile.

Thesis: *"Tonary.io is a dark-first sound-design intelligence layer that helps FL Studio producers organize plugin knowledge, evaluate patches, compare choices, and move faster — without flattening the creative process."*

Tonary is **not** a rebrand of the legacy FL Studio Master Hub, not a generic plugin database, not an AI chatbot, and not a DAW. See `.claude/project/product-foundation.md`.

### Modules (the only official product modules)
| Module | Role |
|---|---|
| **Tonary Scout** | AI recommendations, plugin/preset/chain matching |
| **Tonary Vault** | curated plugin, preset, chain & parameter records |
| **Tonary Review** | source review + evidence-backed notes |
| **Tonary Flow** | workflow recipes, setup paths, sound-design playbooks |
| **Tonary Briefs** | fast explanations, comparisons, next-step suggestions |

## 3. Mobile-first Flutter mandate

- Design and build for phones first (360–430pt widths). Bottom navigation. Thumb-reachable primary actions. Tap targets ≥48dp. No desktop-first layouts.
- Recommended stack (see `.claude/architecture/`): **Riverpod** (state), **go_router** (navigation), **Drift/SQLite** + bundled seed JSON (offline data), **freezed** (models). These are recommendations — justify any deviation.
- Layered architecture: presentation (`features/`) → domain (`shared/models`, use-cases) → data (`data/`). Features never import each other; data never imports presentation.
- Full `lib/` structure and per-folder rules: `.claude/architecture/app-folder-structure.md`.

## 4. Brand rules (non-negotiable)

Source of truth: `Tonary Brand Kit/` + `.claude/brand/`. Enforced in review.

- **Dark-first.** Core surfaces: bg-app `#07090a`, bg-shell `#0e1114`, surface-card `#151a1f`. Text primary `#f8faf2`.
- **Color law:** Amber `#ffb13b` = **brand action only** (not decoration). Cyan `#38bdf8` = focus/system. Green `#33d17a` = affirmative. Violet `#a78bfa` = exploratory/creative. Red `#f87171` = exceptional/danger.
- On a filled bright-accent button/pill, the **label must be dark** (`#07090a`), never light.
- Use the derived **outline-control `#5a666c`** for control borders, chart axes, keyboard-visible boundaries.
- Never convey meaning by color alone. `text-muted #7e8a82` is microcopy/placeholder only — not body text.
- Fonts: **Inter** (UI), **Space Grotesk** (display, H1–H3/hero only), **IBM Plex Mono** (mono/IDs). Buttons never below 14px/600.
- Honor reduced-motion (`MediaQuery.disableAnimations`). Focus ring = two-layer cyan, never glow alone.
- Full detail: `.claude/brand/brand-rules.md`, `.claude/brand/visual-direction.md`, `.claude/brand/voice-and-tone.md`.

## 5. Architecture rules

- Keep layers honest (see §3). Business logic lives in domain/services, not widgets.
- Offline-first: the local DB (seeded from bundled JSON) is the source of truth; network is for Scout AI generation and optional refresh. `.claude/architecture/offline-first-strategy.md`.
- AI (Scout/Briefs): grounded retrieval over Vault records with **evidence-backed answers** that cite Source References. Never embed API keys in the app. Provider is an **Open Question** (default recommendation: Claude API via a server proxy). `.claude/architecture/ai-assistant-architecture.md`.

## 6. Source-data migration rules

- The legacy **FL Studio Master Hub** and **DEEPER DIVES** folders are **strategic source material, NOT a direct app blueprint.**
- Start with a **migration map**, not a bulk import: `.claude/outputs/migration-map.md`.
- Every migrated fact must trace to a **Source Reference**. Never fabricate plugin data or invent facts from sources.
- Discard: legacy web page-setups (HTML/CSS/JS), purple "glassmorphism / Deep Space Cyberpunk" theme, Next.js code, `.ico`/`desktop.ini` artifacts, batch/session-summary meta files.
- Rules: `.claude/rules/content-migration-rules.md`. Do not modify the original source folders.

## 7. Folder conventions

```
Tonary.io/
├── CLAUDE.md                 ← this file
├── .claude/
│   ├── project/              product foundation, scope, roadmap, terminology
│   ├── architecture/         Flutter mobile architecture & data/AI/testing strategy
│   ├── brand/                brand law, voice, visual direction, naming, UI language
│   ├── rules/                enforceable engineering + content + QA rules
│   ├── workflows/            repeatable step-by-step processes
│   ├── agents/               reusable Claude specialist role definitions
│   ├── commands/             copy/paste-ready command prompts
│   ├── schemas/              Tonary data record schemas (evidence-backed)
│   ├── templates/            fill-in scaffolds (specs, plans, reports)
│   ├── memory/               durable decisions, constraints, glossary, risks
│   └── outputs/              source inventory, migration map, reports, next steps
└── lib/                      (future Flutter app — see architecture/app-folder-structure.md)
```
- Dart files: `snake_case.dart`. Classes: `PascalCase`. Record ids: `kebab-case`. JSON keys: `camelCase`.

## 8. Feature-building rules

- Start from a spec (`.claude/templates/feature-spec-template.md`) and follow `.claude/workflows/feature-build-workflow.md`.
- Place code by layer/module; reuse `design_system/` tokens and `shared/` widgets — do not re-derive colors or spacing inline.
- Add no new package dependency without justification (`.claude/rules/flutter-rules.md`).

## 9. Testing expectations

- Unit-test domain logic, services, and mappers. Widget-test features. Golden-test design_system components. Integration-test key flows. See `.claude/architecture/testing-strategy.md`.
- New logic ships with tests. A change is not "done" until it is verified (build passes + behavior observed).

## 10. Documentation expectations

- Update `.claude/memory/decisions.md` when a durable decision is made; add unknowns to `.claude/memory/open-questions.md`.
- Keep `.claude/project/` and schemas in sync with what the code actually does. Update the changelog (`.claude/templates/changelog-template.md`) on releases.

## 11. What Claude must NEVER do

- Never present Tonary as a rebrand of FL Studio Master Hub, or carry over its web stack/theme.
- Never use FL Studio interface terms (Browser, Plugin Database, Channel Rack, Mixer, Playlist) as Tonary product/module names. FL Studio is third-party context.
- Never make `TONARY.wav` the app/package/store name.
- Never build desktop-first screens or add unjustified dependencies.
- Never fabricate plugin data, presets, parameter values, or citations.
- Never overwrite or delete existing useful work (or the source folders) without inspecting it first.
- Never create empty placeholder files.
- Never report success unless the files actually exist and are non-empty (verify).
- Never turn amber into a general decoration color, or convey meaning by color alone.

## 12. How Claude reports work after every change

End every unit of work with a short report:
1. **What changed** — files created/edited (paths).
2. **Why** — the decision or requirement it satisfies.
3. **Verification** — build/test/observed result (or explicitly "not run" and why).
4. **Follow-ups / Open Questions** — anything unresolved.

Use the report format in `.claude/templates/qa-report-template.md` for QA passes and the format in the relevant command file otherwise.
