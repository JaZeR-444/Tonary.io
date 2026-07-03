# /review-mobile-ui — Review a Screen Against Brand Kit + Mobile-First Rules

**Purpose:** Audit one screen (or widget) for compliance with the Tonary brand kit, color law, type system, motion tokens, and mobile-first/accessibility rules. Produces a pass/fail review with fixes.

**When to use:**
- After `/build-screen`, before merging.
- When a screen "feels off" or inconsistent with the rest of the app.

**Required context (read these first):**
- Canonical brief (brand tokens, color law, type scale, motion tokens).
- `.claude/rules/brand-kit.md` and `.claude/rules/mobile-first.md` (if present).
- Design-system token definitions in Dart.
- The screen/widget file(s) under review.

**Inputs to specify when invoking:**
- File path(s) of the screen/widget.
- Optional: target device sizes / orientation constraints.

**Execution steps (checklist):**
1. **Tokens:** No raw hex or magic px outside `design_system/`. Colors resolve to `TonaryColors.*`, text to `TonaryTypography.*`.
2. **Color law:** Violet = brand action only (not decoration). Lavender = focus/system. Green = success. Lavender = exploratory. Rose = exceptional. Meaning never conveyed by color alone. On filled bright-accent buttons the label is light `#f4f2fb`.
3. **Type:** Display face (Space Grotesk) only for H1–H3/hero — never in tables, forms, nav, tabs, badges. Buttons ≥14px/600. `text-muted` limited to microcopy/placeholder.
4. **Surfaces:** Correct elevation ladder (bg-app → bg-shell → surface-card → surface-raised → surface-hover). Borders use border-subtle/strong; control outlines use outline-control `#6b6493`.
5. **Mobile-first:** Single-column, safe-area aware, primary action thumb-reachable, no fixed desktop widths, no horizontal body scroll.
6. **States:** Loading, empty, error, loaded all handled; empty state guides next action.
7. **Motion:** Uses named tokens (micro/fast/base/medium/panel/chart); honors `MediaQuery.disableAnimations`. Focus ring is two-layer violet, not glow alone.
8. **A11y:** ≥44px targets, semantics labels, sufficient contrast, dynamic text scaling tolerated.

**Output / report format:**
- **Verdict:** Pass / Pass-with-fixes / Fail.
- **Findings table:** `Rule | Location (file:line) | Severity | Fix`.
- **Quick wins** vs **must-fix-before-merge**.
- `Recommendation:` for subjective/brand-polish items; `Open Question:` where the brief is silent.

**Guardrails:**
- This is a review, not a rewrite — propose fixes, only edit if explicitly asked.
- Do not invent new tokens or colors; cite the brief/brand-kit for every ruling.
- Flag any legacy purple/glassmorphism resurfacing as a High severity finding.
