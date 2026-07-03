# Tonary.io — Foundation Report

> Generated: 2026-07-02. Result of the foundation pass that built the starting `.claude` development
> framework for the mobile-first Flutter app **Tonary** (project identity **Tonary.io**).

## 1. What was reviewed
Four sibling source folders (read-only, unmodified):
- **`2026 — FL Studio Plugin ~ DEEPER DIVES/`** — ~190 plugin folders, standardized `00-START-HERE / 01-Learning / 02-Data{parameters,presets,rules} / 03-Workflows / 04-Reference` structure; ~98 standardized (per `STANDARDIZATION-GUIDE.md`). Real JSON inspected (`FLEX/02-Data/parameters/flex-params.json`, preset sets). Research corpus + official-manual link index.
- **`FL-Studio-Master-Hub/`** — legacy Next.js 14 / React / Tailwind / Chart.js / GSAP web app, static-export, "purple glassmorphism / Deep Space Cyberpunk," desktop-first. `package.json` + `CLAUDE.md` inspected; its modular plugin-data + aggregation pipeline is the one idea worth carrying.
- **`Tonary Brand Kit/`** — production-grade dark-first token system. Read: Brand Strategy, Original Source Report (naming/color rationale), and `tonary-brand-tokens.json` (full color/type/motion tokens).
- **`Project - FL Studio Plugin/`** — superseded `.archive` of the plugin set (fallback only).

Full detail: [source-inventory.md](./source-inventory.md).

## 2. What was created
A complete `.claude` framework + root `CLAUDE.md` under `Tonary.io/`. **69 files under `.claude/`** plus `CLAUDE.md`, across 11 categories. No Flutter code (intentional — target folder empty, no scaffold without confirmation).

## 3. Full folder tree
```
Tonary.io/
├── CLAUDE.md
└── .claude/
    ├── project/        (7) project-overview, product-foundation, product-principles,
    │                       target-user, mvp-scope, roadmap, terminology
    ├── architecture/   (9) flutter-mobile-architecture, app-folder-structure,
    │                       navigation-architecture, state-management, data-layer,
    │                       content-knowledge-base, ai-assistant-architecture,
    │                       offline-first-strategy, testing-strategy
    ├── brand/          (5) brand-rules, voice-and-tone, visual-direction,
    │                       naming-rules, ui-language
    ├── rules/          (8) global-rules, flutter-rules, mobile-first-rules, ui-ux-rules,
    │                       data-modeling-rules, content-migration-rules, brand-rules, qa-rules
    ├── workflows/      (7) source-review, feature-build, flutter-screen-build,
    │                       content-migration, design-review, qa-review, release-prep
    ├── agents/         (7) product-architect, flutter-architect, mobile-ui-designer,
    │                       content-taxonomist, brand-systems-designer, ai-feature-architect, qa-engineer
    ├── commands/       (7) audit-project, build-feature, build-screen, migrate-content,
    │                       review-mobile-ui, refactor-flutter, qa-pass
    ├── schemas/        (6) plugin-record, preset-record, workflow-recipe,
    │                       sound-design-note, source-reference, user-session
    ├── templates/      (6) feature-spec, screen-spec, implementation-plan,
    │                       migration-plan, qa-report, changelog
    ├── memory/         (5) decisions, constraints, glossary, open-questions, known-risks
    └── outputs/        (4) source-inventory, migration-map, foundation-report, next-steps
```

## 4. Key product decisions
- Tonary is a **NEW** product — a premium, dark-first **sound-design intelligence layer**, not a rebrand of the FL Studio Master Hub, not a plugin database, not a chatbot. ([product-foundation.md](../project/product-foundation.md))
- Modules: **Scout · Vault · Review · Flow · Briefs** (the only official modules).
- MVP (Recommendation): **Vault + Briefs + basic Scout + search + onboarding + settings**; Review/Flow later. ([mvp-scope.md](../project/mvp-scope.md))
- Legacy content is **source material, not blueprint** — migrated via a map, every fact cited.

## 5. Flutter architecture decisions
- **Mobile-first Flutter** (iOS+Android), offline-first, layered (features → domain → data).
- Recommended stack: **Riverpod**, **go_router**, **Drift/SQLite + bundled seed JSON**, **freezed**.
- Canonical `lib/` tree documented per-folder; feature folders map 1:1 to modules. ([app-folder-structure.md](../architecture/app-folder-structure.md))
- AI (Scout/Briefs): grounded retrieval over Vault with evidence-backed, cited answers; keys never in-app (server proxy). Provider = Open Question. ([ai-assistant-architecture.md](../architecture/ai-assistant-architecture.md))

## 6. Brand & naming decisions
- **Tonary** (official) / **Tonary.io** (project) / **TONARY.wav** (hero only — never app/package/store name).
- Dark-first; **color law**: violet=action, lavender=focus/system, green=success, lavender=creative, rose=exceptional. Violet ≠ decoration; violet-fill labels must be light; derived `outline-control #6b6493` required.
- Fonts: Inter (UI) / Space Grotesk (display H1–H3/hero) / IBM Plex Mono (mono/IDs).
- FL Studio interface terms are **third-party context**, never Tonary branding. ([naming-rules.md](../brand/naming-rules.md), [brand-rules.md](../brand/brand-rules.md))

## 7. Source migration strategy
- Map-first, not import. Keep/Rewrite/Archive/Ignore per source, each mapped to a target module + schema. ([migration-map.md](./migration-map.md))
- Discard legacy web page-setups, purple theme, Next.js code, meta/batch files.
- Adopt the legacy *modular data pattern* (manifest → enriched → index) re-mapped to Tonary schemas + a build-time seed pipeline.
- Pilot vertical slice first: **FLEX, Sytrus, Fruity Parametric EQ 2**.

## 8. Risks / open questions
Top items (full lists in [known-risks.md](../memory/known-risks.md) / [open-questions.md](../memory/open-questions.md)):
- 🔴 **Content licensing/attribution** for manual-derived data & preset reproduction — blocks publishing Vault.
- 🟠 **AI provider/backend undecided** (keys must never ship in-app).
- 🟠 **Plugin data completeness/accuracy** (~98/190 standardized; needs an audit before seeding).
- 🟡 Stack lock (Riverpod/go_router/Drift), Flutter token-fidelity, MVP module set — all Recommendations pending confirmation.

## 9. Verification
- **69 files** under `.claude/` + root `CLAUDE.md`; directory counts: project 7, architecture 9, brand 5, rules 8, workflows 7, agents 7, commands 7, schemas 6, templates 6, memory 5, outputs 4.
- **0 empty files** (verified via `find -type f -empty`). Smallest file 1.2 KB (a template) — all substantive.
- Required artifacts confirmed present: `CLAUDE.md`, `.claude/`, all subfolders, `outputs/foundation-report.md` (this file), `outputs/migration-map.md`, `outputs/next-steps.md`, `outputs/source-inventory.md`.

## 10. Recommended next prompts
See [next-steps.md](./next-steps.md) for the ordered list of the next 5–10 prompts to run.
