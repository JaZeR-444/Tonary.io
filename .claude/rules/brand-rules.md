# Brand Rules — Code-Review Guardrail

> Scope: A concise, checkable enforcement list for code review. This is the **guardrail flavor** — the
> `/qa-pass` and `review-mobile-ui` commands read this file. The fuller brand law is [../brand/brand-rules.md](../brand/brand-rules.md).
> For the full rationale, color roles, and voice, see the `../brand/` docs.

Fail the review if any check below is violated. Each item is intended to be mechanically verifiable in a diff.

## Color law checklist
- [ ] **No hardcoded hex** in widgets/components. Colors come from `TonaryColors` tokens only.
- [ ] **Violet (`#6b5cd6`) is brand action only** — not backgrounds, dividers, whole cards, whole navbars, or icon sets.
      More than one competing violet element in a view = fail.
- [ ] **The violet brand fill carries a light label** (`#f4f2fb`). Dark text on the violet brand fill = fail (dark labels are light-theme only).
- [ ] **Color meaning is fixed:** violet=action, lavender=focus/system, green=success, amber=warning, rose=error; cyan=restrained support. No repurposing.
- [ ] **No meaning by color alone** — every status/series/selection also has icon, label, shape, or dash/marker.
- [ ] **`text-muted` (`#837da3`) is placeholder/microcopy only** — never body text, never on raised/hover fills.

## Outline & surface checklist
- [ ] **Control outlines use `outline-control` (`#6b6493`)** — secondary buttons, inputs, chart axes. `border-subtle`/`border-strong` as a control outline = fail.
- [ ] Depth via elevation (`bg-app → surface-card → surface-raised → surface-hover`), **not glow or glassmorphism**.
- [ ] No neon glow as a **sole** state indicator. Focus = two-layer violet ring, not glow alone.
- [ ] Modals: `surface-raised` + `outline-control` + dark scrim — grounded, not glassy.

## Typography checklist
- [ ] **Display face (Space Grotesk) only for H1–H3 / hero** — never tables, forms, nav, tabs, badges.
- [ ] Buttons never below **14px / 600**. Mono (IBM Plex Mono) for tokens/ids/params, UI face (Inter) for everything else.

## Accessibility checklist (brand-adjacent)
- [ ] Text contrast ≥ 4.5:1; non-text (icons, outlines) ≥ 3:1. See [ui-ux-rules.md](ui-ux-rules.md).
- [ ] Visible focus on all interactive elements; reduced-motion honored (`MediaQuery.disableAnimations`).

## Naming & voice checklist
- [ ] Product called **Tonary** / **Tonary.io**; `TONARY.wav` only in hero/campaign, never app/package/store name.
- [ ] Modules named **Scout / Vault / Review / Flow / Briefs** — no FL Studio terms (Browser, Plugin Database, Channel Rack, Mixer) as Tonary labels.
- [ ] Copy leads with "indexed sound-design intelligence", not "AI chatbot". Precise verbs, sentence case, no emoji. See [../brand/voice-and-tone.md](../brand/voice-and-tone.md).
- [ ] Errors state what happened / why / what next. Empty states give a next action.

## Iconography checklist
- [ ] 24px grid, 1.75px stroke, rounded caps, stroke-first. Filled icons **only** for active nav / badges.

If a check can't be verified from the diff alone, flag it `Open Question:` in the review rather than passing silently.
