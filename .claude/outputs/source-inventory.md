# Source Inventory — Tonary.io Foundation Pass

> Generated: 2026-07-02. Based on direct inspection of the four source folders under
> `C:\Users\JaZeR\OneDrive\Desktop\Projects\FL Studio App - NEW 2026\`.
> Nothing below is claimed to exist unless it was observed during inspection.

## Summary

Four source folders were reviewed. They fall into three strategic buckets:
1. **Content goldmine** — `2026 — FL Studio Plugin ~ DEEPER DIVES` (structured plugin knowledge).
2. **Legacy product to learn from, not carry** — `FL-Studio-Master-Hub` (a Next.js web app).
3. **Brand foundation to adopt** — `Tonary Brand Kit` (production-grade token system).
Plus one superseded archive — `Project - FL Studio Plugin`.

---

## 1. `2026 — FL Studio Plugin ~ DEEPER DIVES/`  — KEEP (primary content source)

- **~190 top-level entries**, dominated by one folder per FL Studio stock plugin (3x Osc, Autogun, BooBass, Edison, FLEX, FPC, Fruity Limiter, Fruity Parametric EQ 2, Harmor, Sytrus, etc.).
- **Standardized plugin folder structure** (documented in `STANDARDIZATION-GUIDE.md`; ~98 plugins standardized against the `FLEX` template):
  ```
  <Plugin>/
  ├── 00-START-HERE.md            entry point / navigation
  ├── MASTER-INDEX.md             searchable index
  ├── README.md                   overview
  ├── 01-Learning/{Concepts, Quick-Reference}
  ├── 02-Data/{parameters, presets, rules}   ← JSON
  ├── 03-Workflows/{by-goal, by-instrument}
  ├── 04-Reference/technical-docs
  └── FL Studio Master Hub - Plugin Page Setup/  (legacy web HTML/CSS/JS — DISCARD)
  ```
- **Real structured data observed** — e.g. `FLEX/02-Data/parameters/flex-params.json`, and preset JSON sets (`envelope-shapes.json`, `genre-templates.json`, `limiter-dynamics.json`, `macro-archetypes.json`, `master-filter-curves.json`).
- **Research corpus** — `deep-research-plugins-1..14.txt`, `genre-specific-plugin-research.md`, `fl-studio-online-manual-plugin-pages.md` (official-manual link index — a Source Reference goldmine).
- **Meta / process files** (batch summaries, session summaries, standardization guide, execution plans, `AGENTS.md`/`GEMINI.md`/`QWEN.md`) — process history, **not app content**.
- **UI mockup images** — `fl-studio-hub-*.png` (top/bottom/side nav, dashboard) reflect the LEGACY web design; treat as historical reference only.
- **Useful for Tonary:** plugin factual data, parameter/preset JSON, learning content, workflow recipes, the official-manual link index.

## 2. `FL-Studio-Master-Hub/`  — LEARN FROM, DO NOT CARRY (legacy product)

- A **Next.js 14 + TypeScript web app** (see `package.json`: next 14, react 18, tailwindcss, chart.js, react-chartjs-2, gsap, lucide-react). Static export to GitHub Pages. Desktop-first.
- **Design system:** "Purple glassmorphism / Deep Space Cyberpunk" (dark backgrounds, purple `#7c3aed` accent, glass cards, GSAP blobs). **Conflicts with the Tonary Brand Kit (amber/cyan, dark-first, restrained).** Discard the theme.
- **Valuable IDEA to carry (not the code):** its **modular plugin data architecture** — per-plugin `manifest.json` + `data/{parameters,presets,rules}` + `learning/` + `workflow/`, aggregated by `scripts/aggregate-plugin-data.js` into `allPlugins.json`, `searchIndex.json`, `taxonomy.json`, `capabilityMatrix.json`. This maps cleanly onto Tonary's Vault schemas and a build-time seed pipeline.
- Contains its own `.claude/skills`, `.git` history, `docs/` (PURPLE_DESIGN_GUIDE, APP-MAP, INGESTION, MIGRATION_CHECKLIST). **Do not modify this folder.**
- Also contains a nested copy `2026 — FL Studio Plugin ~ DEEPER DIVES - Copy/` (duplicate of source #1) — ignore in favor of the top-level original.

## 3. `Tonary Brand Kit/`  — ADOPT (brand foundation)

- `tonary_brand_kit_resource/` with:
  - **Notion Import Pages** (00–14): Brand Strategy, Color System, Accessibility & Contrast, Typography, Component Rules, Iconography & Imagery, Motion, Logo & Lockup, Implementation Guide, Deliverables, Rollout, **Code Review Guardrails**, Notion DB Schema, and the **Original Source Report (Cleaned)** — the naming/color rationale.
  - **Implementation Assets:** `tonary-brand-tokens.css`, `tonary-brand-tokens.json` (the full source + derived token set — colors, fonts, type scale, motion).
  - **Reference Tables (CSV):** brand_tokens_db, typography_scale_db, component_rules_db, accessibility_checks_db, motion_tokens_db, rollout_tasks_db, resource_page_index.
  - **Visual References:** `tonary-color-swatch-board.svg`.
- **Confirms the naming rules** (Tonary official / Tonary.io project / `.wav` hero only) and the **color law** (amber=action, cyan=focus, green=affirmative, violet=creative, red=exceptional). Dark-first, light theme not required at launch.
- **Directly reusable** in Tonary via `.claude/brand/` and, later, `lib/design_system/tokens/`.

## 4. `Project - FL Studio Plugin/`  — ARCHIVE (superseded)

- Almost entirely `.archive/` containing an older copy of the same plugin folder set (3x Osc … Fruity Mute 2 … etc.).
- Superseded by `2026 — FL Studio Plugin ~ DEEPER DIVES`. **Ignore for migration** except as a fallback if a plugin is missing/incomplete in the primary source.

---

## What is still useful for Tonary.io
- Plugin **facts, parameters, presets, workflows** (source #1) → Vault / Flow / Briefs content.
- The **official-manual link index** → Source References.
- The **modular data + aggregation pattern** (source #2 idea) → build-time seed pipeline.
- The **brand token system** (source #3) → design system + brand rules.

## What should be archived / ignored / renamed
- Legacy **web page-setup files** (HTML/CSS/JS per plugin), purple theme, Next.js code, GSAP/Chart.js patterns → ignore.
- **Batch/session/standardization meta files**, `.ico`/`desktop.ini`/`.frontmatter` artifacts → ignore.
- `Project - FL Studio Plugin/.archive` → archive/fallback only.

## Product assumptions from the old Master Hub that must NOT carry forward
- Desktop-first web layout, GitHub-Pages static-export constraints.
- "Deep Space Cyberpunk" purple glassmorphism identity (replaced by Tonary amber/dark brand).
- "Plugin database / hub" framing (Tonary is an intelligence *layer*, not a database).
- FL Studio interface terminology as product branding.
- Chart.js/GSAP-heavy, animation-first presentation.

## Open Questions
- **Open Question:** How complete/accurate is the per-plugin JSON across all ~190 folders? (Standardization guide says ~98 standardized, many "partial".) A per-plugin completeness audit is needed before seeding — tracked in `migration-map.md`.
- **Open Question:** Are there licensing/attribution constraints on reproducing FL Studio manual-derived content? Must be resolved before publishing Vault data (see `.claude/memory/known-risks.md`).
