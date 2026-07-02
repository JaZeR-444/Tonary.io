# Brand Rules — The Enforceable Brand Law

> Scope: The non-negotiable brand law for Tonary. This is the fuller reference.
> The code-review guardrail flavor lives in [../rules/brand-rules.md](../rules/brand-rules.md).
> Voice: [voice-and-tone.md](voice-and-tone.md) · Visual: [visual-direction.md](visual-direction.md) ·
> Naming: [naming-rules.md](naming-rules.md) · UI language: [ui-language.md](ui-language.md)

Tonary is a premium, **dark-first sound-design intelligence layer** for FL Studio producers.
The brand posture is restrained, technical, and studio-native. Every rule below is enforceable
in design review and code review. When unsure, prefer restraint.

## 1. Dark-first is the law
- The app canvas is always dark. There is no light-mode fallback shipped at launch.
- Bright accent colors are **foregrounds on dark**, not backgrounds. Never flood a surface with accent.
- Surfaces build depth through elevation (card → raised → hover), not through glow or glass.

## 2. The core color table (immutable source tokens)

| Role | Token | Hex | Enforced use |
| --- | --- | --- | --- |
| Global canvas | bg-app | `#07090a` | App background, deepest shell, full-screen views. Also the dark label color on bright fills. |
| Shell / chrome | bg-shell | `#0e1114` | Nav, sidebars, dock regions, app chrome. |
| Default surface | surface-card | `#151a1f` | Cards, inputs, panels, tables. Best default fill. |
| Elevated surface | surface-raised | `#1d242b` | Modals, hover-lifted cards, selected rows. Use sparingly. |
| Interaction surface | surface-hover | `#26313a` | Hover/pressed/active row backgrounds. Fills only, not text. |
| Decorative divider | border-subtle | `#2f3a43` | Non-essential dividers only. Never a control outline. |
| Strong divider | border-strong | `#43505a` | Data rows, modal edges. Still too weak for outline-only controls. |
| **Control outline (DERIVED)** | **outline-control** | **`#5a666c`** | **Required for control outlines, chart axes, interactive borders. The missing production token.** |
| Primary text | text-primary | `#f8faf2` | All main UI text, headings, data values. |
| Supporting text | text-secondary | `#b8c0b5` | Descriptions, metadata, side labels. |
| Microcopy only | text-muted | `#7e8a82` | Placeholder, timestamps, tiny metadata **only**. Never body copy. |
| Brand action (amber) | accent-primary | `#ffb13b` | Primary CTA fill, active nav, selected action. |
| Amber hover | amber-hover | `#ffc766` | CTA hover, highlight, logo spark. |
| Amber active | amber-active | `#da9834` | Pressed/active CTA. |
| Affirmative (green) | success | `#33d17a` | Success badges, confirmations, live-good states. |
| Focus/system (cyan) | info | `#38bdf8` | Focus ring, info badges, sync/live indicators. |
| Exploratory (violet) | creative | `#a78bfa` | Discovery states, experimental labels, sound-design tags. |
| Warning (orange) | warning | `#f59e0b` | Caution badges, incomplete states. |
| Exceptional (red) | danger | `#f87171` | Errors, destructive actions, failed states. |

Derived soft surfaces (tinted status backgrounds — never the accent itself):
`brand #2b2419` · `success #122820` · `info #13262f` · `warning #2a2213` · `danger #2a1d1f`.

## 3. The color law (meaning is fixed)
- **Amber = brand action.** Cyan = focus/system. Green = affirmative. Violet = exploratory. Red = exceptional.
- Colors carry fixed meaning. Do not repurpose green for a brand accent or violet for an error.

## 4. Amber is not decoration
- Amber marks the one decisive action in a view: save, generate, review, compare, import, continue.
- Do **not** amber-tint whole cards, whole navbars, backgrounds, dividers, or icon sets.
- If more than one amber element competes for attention in a view, one of them is wrong.

## 5. Bright-accent → label must be dark
- On any filled bright-accent surface (amber, green, cyan, violet, orange, red), the label/foreground
  must be dark (`#07090a`). Never light text on a bright fill — it fails contrast and looks cheap.
- Bright accents as **foreground text/icons on dark surfaces** are correct and encouraged.

## 6. Outline-control token is required
- `outline-control #5a666c` is the production outline for secondary buttons, inputs, and chart axes.
- The weaker source borders (`border-subtle`, `border-strong`) are **not** substitutes. The outline is not optional.

## 7. No meaning by color alone
- Every color-coded state must also carry an icon, label, shape, dash pattern, or position.
- Data-viz series need dash/marker redundancy in addition to accent color. Accessibility over aesthetics.

## 8. Premium, restrained posture
- No neon glow as a sole state indicator. No purple glassmorphism. No "Deep Space Cyberpunk" theme
  (that was the legacy Master Hub — a different, discarded product).
- Focus ring = two-layer cyan, never a glow alone. Motion is quick and functional (see visual-direction.md).
- Display face (Space Grotesk) only for H1–H3 / hero — never in tables, forms, nav, tabs, or badges.

Recommendation: Encode these as lint-checkable rules in [../rules/brand-rules.md](../rules/brand-rules.md)
so `/qa-pass` and `review-mobile-ui` can enforce them mechanically.
