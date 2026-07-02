# Known Risks — Tonary.io

> Risks to actively manage. Severity: 🔴 blocking · 🟠 high · 🟡 medium. Review each phase.

## Legal / IP
- 🔴 **Content licensing/attribution.** Vault/Briefs data is derived from FL Studio manuals, factory presets, and third-party research. Reproducing it may require attribution or permission. **Blocks publishing Vault.** Mitigation: legal review; prefer original phrasing + citations; link out rather than reproduce where unsure. (OQ-12)
- 🟠 **Trademark boundaries.** "FL Studio" / "Image-Line" are third-party marks. Tonary must present as unaffiliated and use these terms only as platform context — never as branding. Mitigation: naming rules (`../brand/naming-rules.md`), a disclaimer in-app.

## Content quality
- 🟠 **Fabrication risk on migration.** Legacy JSON is partially complete (~98/190 standardized); some parameter values may be unverified. Seeding them wholesale would ship wrong data. Mitigation: validate against official manual, cite sources, no bulk import. (OQ-07)
- 🟡 **Source rot.** Manual URLs may change. Mitigation: `retrievedAt` + optional snapshot on every `source-reference`.

## Product
- 🟠 **Scope creep / legacy drift.** Temptation to re-create the old "hub" feature-by-feature. Mitigation: MVP discipline (`../project/mvp-scope.md`), "intelligence layer not database" principle.
- 🟡 **AI over-promise.** Positioning as "AI chatbot" would undercut the trust/restraint brand and set wrong expectations. Mitigation: retrieval-first, evidence-backed, assistant-only-when-it-helps.

## Technical
- 🟠 **AI provider/back-end unresolved.** No backend decided; keys must never ship in-app. Mitigation: server-proxy pattern, provider abstraction in `core/services/`. (OQ-05)
- 🟡 **Brand token → Flutter fidelity.** Web CSS tokens may need tuning on mobile OLED; contrast must be re-verified in-app. Mitigation: golden tests + accessibility checks. (OQ-11)
- 🟡 **Offline seed size.** Bundling all ~190 plugins' data could bloat the app. Mitigation: seed priority set first, lazy/optional content packs later.

## Process
- 🟡 **Framework/code drift.** `.claude/` docs can fall out of sync with real code once building starts. Mitigation: update decisions/schemas on change; `/audit-project` command; CLAUDE.md §10.
