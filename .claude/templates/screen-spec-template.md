# Screen Spec — `<Screen Name>`

> Mobile-first. Copy and fill every `<placeholder>`. Dark-first, premium, restrained.
> Related: [feature-spec-template.md](feature-spec-template.md) · [../project/product-principles.md](../project/product-principles.md) · design tokens in `lib/design_system/tokens/`

## Identity
- **Screen name:** `<name>`
- **Route:** `<go_router path, e.g. /vault/:id>`
- **Module:** `<Scout | Vault | Review | Flow | Briefs>`
- **Feature folder:** `lib/features/<folder>/`

## Layout (mobile-first)
_Describe the phone portrait layout first (360–430px). Note tablet/large adaptation only if needed._
- App bar: `<title, actions>`
- Body: `<scroll region, sections>`
- Bottom: `<primary action / nav>`

## Widget Tree (sketch)
```
Scaffold
 ├─ AppBar(<title>)
 ├─ Body: CustomScrollView
 │   ├─ <HeaderCard>
 │   ├─ <ContentList>
 │   └─ <StateSlot loading|empty|error>
 └─ <PrimaryActionButton>
```

## Design Tokens Used
_Semantic Dart names from `TonaryColors` / `TonaryTypography` — not raw hex._
| Element | Token | Note |
|---|---|---|
| Canvas | `bgApp` | `#07090a` |
| Card | `surfaceCard` | `#151a1f` |
| Primary action | `accentPrimary` (amber) | label must be `bgApp` dark |
| Focus ring | `infoFocus` (cyan) | two-layer, never glow alone |
| Body text | `textPrimary` | `textMuted` = placeholder ONLY |

## States
- **Loading:** `<skeleton / shimmer, respects reduced-motion>`
- **Empty:** `<icon + copy + CTA>`
- **Error:** `<message + retry, offline-first>`
- **Populated:** `<default>`

## Interactions
- `<tap / long-press / swipe>` → `<result>` — motion token `<micro 120 | fast 160 | base 180>`.

## Accessibility
- Min tap target 48x48dp. Contrast AA on dark. Semantics labels on icon buttons.
- Never convey meaning by color alone. Honor `MediaQuery.disableAnimations`.

## Golden-Test Note
_What the golden/widget test locks:_ `<layout at 390px, populated + empty states, dark theme>`
