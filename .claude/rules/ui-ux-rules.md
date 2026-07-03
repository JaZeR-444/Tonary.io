# UI/UX Rules

> Scope: Interaction and accessibility rules, grounded in the Tonary Brand Kit.
> Inherits [global-rules.md](global-rules.md). Enforces [brand-rules.md](brand-rules.md) and
> [../brand/brand-rules.md](../brand/brand-rules.md). Widths/targets in [mobile-first-rules.md](mobile-first-rules.md).

## Focus visibility
- Every interactive element has a **visible focus state**. Focus ring = **two-layer violet** (`#8b7bf0`), never a glow alone.
- Inputs on focus: cyan border + outside ring. Focus must be visible on `bg-app`, `bg-shell`, and `surface-card`.
- Never remove focus indicators. Keyboard/switch/AT users depend on them.

## Reduced motion
- Honor `prefers-reduced-motion`. In Flutter, check `MediaQuery.of(context).disableAnimations`.
- When disabled: cut to end state, no partial transitions, no chart draw-in animation. Motion is never required to convey meaning.
- Motion durations follow the tokens in [../brand/visual-direction.md](../brand/visual-direction.md) (micro 120 → chart 420–480ms).

## Contrast
- **Text: ≥ 4.5:1** against its background (large text ≥ 3:1). **Non-text (icons, borders, control outlines): ≥ 3:1**.
- Use `text-primary #f4f2fb` for body; `text-secondary #b8b2d6` for supporting copy. `text-muted #837da3` is
  **placeholder/microcopy only** — never body text, never on raised/hover fills.
- Control outlines use `outline-control #6b6493` (3.17:1 on shell) — the weaker source borders fail non-text contrast.
- Violet brand fills carry **light** labels (`#f4f2fb`); reserve dark labels for the light theme.

## No meaning by color alone
- Status, series, and selection must also be conveyed by icon, label, shape, position, or dash/marker pattern.
- Data-viz: accent colors **plus** dash/marker redundancy. Axes use `outline-control`. Never color-only series.
- Selected state uses more than a color swap (violet left rule, soft surface, checkmark, or border emphasis).

## Required states (every data-driven view)
Every screen/list that loads data must design and implement all of:
1. **Loading** — skeleton or verb + ellipsis ("Indexing…"), never a frozen blank.
2. **Empty** — what this is + next action (see [../brand/ui-language.md](../brand/ui-language.md)).
3. **Error** — what happened / why / what next; calm tone, red reserved for exceptional/blocking.
4. **Populated** — the normal state.
5. (Where relevant) **Offline** — local data shown, "Offline — changes saved locally."

## Spacing scale
- Use a consistent spacing scale (Recommendation: 4pt base — 4, 8, 12, 16, 20, 24, 32, 40). No arbitrary margins.
- Vertical rhythm follows the type scale (anchor 16px, rounded major-third). Cards and lists share consistent insets.
- Density is calmer than the web kit: fewer columns, more breathing room, list/detail over wide tables.

## List / detail patterns
- Prefer **list → detail** navigation over dense multi-column tables on phone widths.
- List rows: full-width tap targets, one primary title (16/24 600), supporting metadata secondary, optional badge.
- Detail screens lead with identity + the one primary action (thumb-reachable), then supporting sections.
- Long tables (e.g. parameter data) scroll horizontally inside their own container; the page body never scrolls sideways.

## Component behavior (from the brand kit)
- Navbar/bottom nav is not an violet strip; only the active item gets accent (violet text/pill or filled icon).
- Cards: hover/press → `surface-raised`; selected ≠ full violet fill. Full violet cards are marketing-only.
- Primary button: violet fill + light label, hover `brand-hover`, active `brand-active`, focus violet ring.
- Secondary button: `surface-card` + `outline-control` (the outline is not optional). Ghost: soft tinted fill + accent label.
- Inputs keep a **persistent visible label**; placeholders are never the only label.
- Modals sit on `surface-raised` + `outline-control` + dark scrim — grounded, not glassy; enter 220–260ms.

## Accessibility mechanics
- Provide `Semantics` labels for icon-only buttons and images. Announce state changes (loading/success/error) to screen readers.
- Support dynamic text scale to at least 1.3× without clipping. Ensure logical focus/traversal order.
