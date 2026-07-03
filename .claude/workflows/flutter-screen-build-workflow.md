# Workflow — Flutter Screen Build

Build a single mobile screen, dark-first and thumb-friendly, with all states and a golden test.

Related: [../agents/mobile-ui-designer.md](../agents/mobile-ui-designer.md) · [feature-build-workflow.md](feature-build-workflow.md) · [design-review-workflow.md](design-review-workflow.md) · [../rules/brand-color-law.md](../rules/brand-color-law.md) · [../architecture/flutter-mobile-architecture.md](../architecture/flutter-mobile-architecture.md)

## Purpose
Produce one production-ready screen that composes existing `design_system/` tokens and `shared/widgets`, handles every state, and is verified by a golden test.

## When to use
Adding or reworking any screen inside a `features/<module>/presentation/` folder.

## Inputs
- Screen spec: purpose, module, data it shows, primary action, navigation in/out.
- Riverpod provider(s) supplying the data (from the feature build).
- Brand tokens (colors, typography, spacing, motion) from `design_system/tokens/`.

## Steps
1. **Screen spec.** One-line purpose, the single primary action, and the data model rendered. Confirm the go_router route.
2. **Widget tree sketch.** Scaffold → app bar/shell → scrollable body → primary action (thumb-reachable bottom third). List/detail composition from `shared/widgets`.
3. **Apply design tokens.** Colors via `TonaryColors`, type via `TonaryTypography`, spacing/radii from tokens. Display face (Space Grotesk) only for H1–H3/hero; never in tabs, badges, tables. No hard-coded hex.
4. **Build all states.**
   - *Loading* — skeletons/shimmer, never a bare spinner where content structure is known.
   - *Empty* — explain + offer the next action (ties to Tonary Briefs voice).
   - *Error* — cause + retry; cyan is system/focus, red only for exceptional failure.
   - *Loaded* — the real content.
5. **Responsive & ergonomics.** Test small (≈360dp) and large phones; min 44–48dp touch targets; safe-area aware; primary actions within thumb arc.
6. **Motion & a11y.** Use motion tokens (micro 120 / fast 160 / base 180ms); honor `MediaQuery.disableAnimations`. two-layer violet focus ring. Semantics labels on interactive/icon-only controls. Meet contrast; never color-only meaning.
7. **Golden test.** Golden for the loaded state (light-not-applicable; dark-first) plus at least empty/error. Widget-test the primary action.

## Output / report format
```
Screen: <name>  Route: <path>  Module: <…>
States implemented: loading / empty / error / loaded
Tokens used: colors <…> type <…> spacing <…>
Ergonomics: min target <dp>, primary action position
Golden test: <file> — pass/fail
Open Questions: <list>
```

## Guardrails
- No raw hex or ad-hoc TextStyles — tokens only.
- Violet = brand action only; never decorative. Filled bright-accent buttons use light (`#f4f2fb`) labels.
- Never ship a screen missing empty/error states.
- No desktop-first layouts or two-pane assumptions.
