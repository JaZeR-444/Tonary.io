# Workflow — Design Review

Review a screen or component against the **Tonary Brand Kit**: color law, typography, motion, focus, contrast, mobile ergonomics.

Related: [../agents/brand-systems-designer.md](../agents/brand-systems-designer.md) · [../agents/mobile-ui-designer.md](../agents/mobile-ui-designer.md) · [flutter-screen-build-workflow.md](flutter-screen-build-workflow.md) · [../rules/brand-color-law.md](../rules/brand-color-law.md) · [../rules/typography-rules.md](../rules/typography-rules.md)

## Purpose
Catch brand and ergonomics violations before QA/merge, so Tonary stays a coherent dark-first system.

## When to use
On any new/changed screen or shared component, before [qa-review-workflow.md](qa-review-workflow.md).

## Inputs
- The screen/component (code + rendered dark-mode capture).
- Brand tokens (colors, type scale, spacing, motion) from `design_system/tokens/`.

## Steps
1. **Color law.** Amber = brand action ONLY (not decoration). Cyan = focus/system. Green = affirmative. Violet = exploratory. Red = exceptional only. Filled bright-accent button → label is dark `#07090a`, never light. No meaning by color alone.
2. **Surfaces.** Correct token hierarchy: bg-app `#07090a` → bg-shell `#0e1114` → surface-card `#151a1f` → raised `#1d242b` → hover `#26313a`. Borders use border-subtle/strong; controls/axes use derived outline-control `#5a666c`.
3. **Typography.** UI = Inter; Display = Space Grotesk for H1–H3/hero ONLY (never tables, forms, nav, tabs, badges); Mono = IBM Plex Mono for values/params. Buttons never below 14px/600. `text-muted #7e8a82` is microcopy/placeholder only, not body.
4. **Motion.** Durations match tokens (micro 120 / fast 160 / base 180 / medium 220 / panel 260 / chart 420–480ms). `prefers-reduced-motion` honored via `MediaQuery.disableAnimations`.
5. **Focus & contrast.** Two-layer cyan focus ring (never glow alone) on every focusable. Text/icon contrast meets AA on the actual surface.
6. **Mobile ergonomics.** Touch targets ≥44–48dp; primary action in thumb arc; safe areas respected; content readable at ≈360dp.
7. **Score & log.** Pass/flag each check with evidence.

## Output / report format
```
Target: <screen/component>
| Check | Result | Note |
| Color law | PASS/FLAG | … |
| Surfaces | … |
| Typography | … |
| Motion | … |
| Focus/contrast | … |
| Ergonomics | … |
Verdict: PASS / CHANGES REQUESTED
Fix list: <ordered> · Open Questions: <list>
```

## Guardrails
- Reviewer does not "approve to unblock"; flag honestly or fail.
- Immutable source tokens — reviewer proposes token changes to brand-systems-designer, never edits ad hoc.
- No FL Studio interface terms as Tonary UI labels.
- Reject any raw hex / ad-hoc TextStyle not sourced from tokens.
