# /build-screen — Build One Mobile Screen

**Purpose:** Build a single Flutter screen following the `flutter-screen-build-workflow` — mobile-first, dark, offline-first, fully tokenized, with all states handled.

**When to use:**
- Adding one screen to an existing feature (list, detail, form, results, onboarding step).
- Prototyping a screen before wiring full data.

**Required context (read these first):**
- Canonical brief (brand tokens, motion tokens, type scale, color law).
- `.claude/workflows/flutter-screen-build-workflow.md`.
- `.claude/rules/flutter-rules.md` and design-system components.
- Schema(s) for any records the screen renders.

**Inputs to specify when invoking:**
- Screen name + parent feature/module.
- Screen type (list / detail / form / results / empty-first).
- Data source (provider name) or "static placeholder for now".
- Primary user action on the screen.

**Execution steps:**
1. Restate the screen's single primary job and its primary action.
2. Define the widget file under `features/<feature>/presentation/screens/`; extract reusable pieces into `presentation/widgets/`.
3. Lay out mobile-first: single-column, safe-area aware, thumb-reachable primary action, scrollable body. No fixed desktop widths.
4. Bind state via Riverpod; render all four states — loading, empty, error, loaded. Empty state must guide the next action.
5. Apply tokens only: `TonaryColors.*`, `TonaryTypography.*`, spacing scale. Display face for H1–H3/hero only, never in nav/tabs/badges/forms.
6. Enforce color law: amber = brand action, cyan = focus/system, green = affirmative, violet = exploratory, red = exceptional. Filled bright-accent buttons use dark label `#07090a`.
7. Add motion using the named tokens (micro 120ms … panel 260ms); honor `MediaQuery.disableAnimations`. Two-layer cyan focus ring.
8. Verify accessibility: ≥44px touch targets, semantics labels, contrast, never meaning-by-color-alone.

**Output / report format:**
- Screen + widget file paths (absolute).
- Provider(s) consumed and route registered.
- States implemented and the empty-state next action.
- Screenshot or verification note if the app was run.
- `Recommendation:` / `Open Question:` lines for anything deferred.

**Guardrails:**
- No hardcoded hex/px outside the design system.
- No horizontal body scroll; wide content (tables/chips) scrolls in its own container.
- Buttons never below 14px/600. `text-muted` is microcopy/placeholder only, not body text.
- Do not introduce new brand colors or the legacy purple theme.
