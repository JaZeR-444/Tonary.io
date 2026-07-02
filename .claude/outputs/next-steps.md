# Next Steps — Tonary.io

> The ordered prompts to run after this foundation pass (2026-07-02). Each references framework files
> so future Claude sessions stay consistent. Resolve the ⚠️ decisions before the build-heavy steps.

## Immediate development steps (do first)
1. **Confirm the key Recommendations.** Lock the stack (Riverpod/go_router/Drift/freezed), the MVP module set, the AI provider approach, and the bundle id. These are the Open Questions gating real work: `.claude/memory/open-questions.md` (OQ-01, OQ-04, OQ-05, OQ-10).
2. **Resolve the 🔴 legal question** (OQ-12) before any Vault content is published — see `.claude/memory/known-risks.md`.

## Next 5–10 prompts to run (copy/paste-ready)

1. **`/audit-project`**
   > "Run `.claude/commands/audit-project.md`. Confirm the framework is intact, list any gaps or drift, and verify no source folders were modified."

2. **Confirm decisions & lock the stack**
   > "Review `.claude/memory/open-questions.md`. For OQ-01, OQ-04, OQ-05, OQ-10, here are my choices: [fill in]. Move the confirmed ones into `.claude/memory/decisions.md` and update `.claude/project/mvp-scope.md` accordingly."

3. **Scaffold the Flutter app (only after step 2)**
   > "Create the Flutter project inside `Tonary.io/` following `.claude/architecture/app-folder-structure.md` and `.claude/rules/flutter-rules.md`. Set up the `lib/` tree, `pubspec.yaml` with only the approved dependencies, and a running app shell. Do not build features yet. Report the tree and a passing `flutter analyze`/build."

4. **Build the design system from brand tokens**
   > "Implement `lib/design_system/` (tokens, colors, typography, spacing) and `ThemeData` + `TonaryColors`/`TonaryTypography` extensions from `Tonary Brand Kit/.../tonary-brand-tokens.json`, per `.claude/brand/brand-rules.md`. Add golden tests for core components (primary/secondary button, card, input, badge). Enforce the color law."

5. **Set up navigation + app shell**
   > "Implement go_router and the bottom-nav shell per `.claude/architecture/navigation-architecture.md`, with placeholder screens for Home, Scout, Vault, Review, Flow (+ Search/Settings). Mobile-first, thumb-reachable, safe areas. Follow `.claude/rules/mobile-first-rules.md`."

6. **Design the data layer + seed pipeline**
   > "Implement the Drift schema and repositories for the Tonary record types in `.claude/schemas/`, plus a bundled-seed loader, per `.claude/architecture/data-layer.md` and `content-knowledge-base.md`. Add a validator that rejects records missing `sources[]` or with bad id casing. Unit-test it."

7. **Pilot content migration (FLEX, Sytrus, Fruity Parametric EQ 2)**
   > "Run `.claude/commands/migrate-content.md` for FLEX, Sytrus, and Fruity Parametric EQ 2. Take each fully through Plugin Record → a few Preset Records → 1–2 Workflow Recipes → Source References, following `.claude/rules/content-migration-rules.md`. Validate; do not fabricate. Update `.claude/outputs/migration-map.md` status."

8. **Build the Vault module (MVP core)**
   > "Run `.claude/commands/build-feature.md` for Tonary Vault: list → detail of plugin/preset records from the seed DB. Offline-first, all required states. Then `/review-mobile-ui` and `/qa-pass`."

9. **Build Briefs + basic Scout**
   > "Build Tonary Briefs (explanations/comparisons over Vault records) and a basic Scout (retrieval-based matching), per `.claude/architecture/ai-assistant-architecture.md`. Retrieval-first, evidence-backed, keys via server proxy. Grounded answers must cite Source References."

10. **QA + release prep dry run**
    > "Run `.claude/commands/qa-pass.md` across the app, then `.claude/workflows/release-prep-workflow.md` as a dry run: versioning, changelog (`.claude/templates/changelog-template.md`), store metadata respecting `.claude/brand/naming-rules.md`. Report readiness."

## Ongoing
- Keep `.claude/memory/decisions.md` and schemas in sync with real code (CLAUDE.md §10).
- Re-run `/audit-project` when things feel drifted.
- Grow migration coverage beyond the pilot only after the seed pipeline + legal clearance are in place.
