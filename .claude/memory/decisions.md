# Decisions — Tonary.io

> Durable decisions future sessions can rely on. Append new decisions with a date; do not silently reverse
> an earlier one — supersede it with a note. Format: `[ID] Date — Decision — Rationale`.

## Foundational (2026-07-02)

- **[D-001] Official name = Tonary; project identity = Tonary.io.** `TONARY.wav` is hero/campaign styling only, never the app/package/store name. — Confirmed by Tonary Brand Kit naming report.
- **[D-002] Tonary is a NEW product, not a rebrand of FL Studio Master Hub.** Different framing ("intelligence layer," not "database"), architecture, and brand. — Explicit project mandate.
- **[D-003] Mobile-first Flutter (iOS + Android), offline-first.** Hard pivot away from the legacy desktop-first Next.js web app. — Project mandate.
- **[D-004] Official modules = Scout, Vault, Review, Flow, Briefs.** No other modules are "official." — Brand architecture.
- **[D-005] Adopt the Tonary Brand Kit as-is.** Dark-first; color law (violet=action, lavender=focus, green=success, lavender=creative, rose=exceptional); Inter/Space Grotesk/IBM Plex Mono; derived `outline-control #6b6493` required. — Brand kit is production-grade.
- **[D-006] FL Studio is third-party context, not Tonary branding.** Never use Browser/Plugin Database/Channel Rack/Mixer/Playlist as Tonary module/product names. — Naming rules.
- **[D-007] Legacy content is source material, not a blueprint.** Migrate via a map, cite every fact, never bulk-import or fabricate. — `../outputs/migration-map.md`.
- **[D-008] Every content record must cite a Source Reference.** Evidence-backed by construction. — Trust is a core differentiator.
- **[D-009] Do not scaffold the Flutter app in this foundation pass.** Target folder is empty; build docs/framework, code only on explicit confirmation. — Prompt Phase 5 + scope discipline.

## Locked (confirmed by user 2026-07-02)

- **[D-010] Flutter stack = Riverpod (state) + go_router (navigation) + Drift/SQLite + bundled seed JSON (local data) + freezed + json_serializable (models).** — Confirmed; supersedes proposal R-001. Closes OQ-04. See `../architecture/state-management.md`, `data-layer.md`, `../rules/flutter-rules.md`.
- **[D-011] MVP = Vault + Briefs + basic Scout + global search + onboarding + settings.** Deferred (not cut): Review authoring, Flow recipe builder, collections, cloud sync. — Confirmed; supersedes proposal R-002. Closes OQ-01. See `../project/mvp-scope.md`.
- **[D-012] Scout/Briefs AI = Claude API via a server proxy, retrieval-first, evidence-backed/cited; API keys never shipped in-app.** — Confirmed; supersedes proposal R-003. Closes OQ-05. Requires a small backend (Open Question OQ-05b: which host). See `../architecture/ai-assistant-architecture.md`.
- **[D-013] Bundle / package id = `io.tonary.app`** (iOS bundle id + Android applicationId). — Confirmed; closes OQ-10 (id portion; store *listing* names still TBD). Respects naming rules (never `TONARY.wav`).

- **[D-014] Pilot content migration complete (seedVersion 2, 2026-07-02).** FLEX, Sytrus, Fruity Parametric EQ 2 migrated from DEEPER DIVES into `assets/seed/` (3 plugins, 3 presets, 3 recipes, 5 notes, 6 sources); every record sourced; validated fail-closed. Supersedes proposal R-004. Publishing gated on OQ-12. — `../outputs/migration-map.md` (Migration log).
