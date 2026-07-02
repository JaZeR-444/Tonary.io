# Visual Direction

> Scope: The look and feel of Tonary — studio-native, restrained, technical.
> Enforces the color law in [brand-rules.md](brand-rules.md). Labels/microcopy in [ui-language.md](ui-language.md).

Tonary should feel like a purpose-built studio instrument, not a consumer app skin. Dark-first, precise,
quietly premium. Every visual choice earns its place. No decoration for decoration's sake.

## Iconography
- **Grid:** 24px. **Stroke:** 1.75px. **Caps/joins:** rounded.
- **Stroke-first:** default icons are outline/stroke. **Filled** icons only for the active nav item and badges.
- Consistent optical weight across a set. No mixed corner radii. No gradients inside icons.
- Motifs come from the studio: waveform, spectrogram, patch/routing nodes, index cards, review flags, tabs, dossier lines.
- Amber is not an icon-set color. Icons are `text-secondary`/`text-primary` on dark; accent color only marks the one active/selected item (see "Amber is not decoration" in brand-rules.md).

## Imagery
- Use: waveform, spectrogram, patch-routing / signal-flow diagrams, indexed-card and dossier motifs, trace lines.
- Avoid: literal music-note clip art, generic DJ/headphone stock, and **neon glow** as a subject or effect.
- Imagery stays dark-grounded and technical. No purple glassmorphism, no cyberpunk haze (that was the legacy Master Hub).
- Bright accents in imagery are sparks/highlights on one focal element, never a wash over the whole frame.

## Surface depth
Depth is built by elevation and outline, not glow or blur:
`bg-app (#07090a)` → `bg-shell (#0e1114)` → `surface-card (#151a1f)` → `surface-raised (#1d242b)` → `surface-hover (#26313a)`.
- Controls get an `outline-control (#5a666c)` border, not a drop shadow, to read as interactive on dark.
- Modals sit on `surface-raised` with an `outline-control` border and a dark scrim — grounded, never glassy.

## Motion tokens

| Token | Duration | Use |
| --- | --- | --- |
| micro | 120ms | icon state, checkbox, tiny toggles |
| fast | 160ms | button press, hover fills |
| base | 180ms | default transitions, tab switches |
| medium | 220ms | expand/collapse, list reveal |
| panel | 260ms | modal/sheet enter (fade + slide) |
| chart | 420–480ms | data-viz draw-in only |

- Motion is functional feedback, never spectacle. Ease-out on enter, ease-in on exit.
- **Honor reduced motion.** In Flutter, gate animations on `MediaQuery.of(context).disableAnimations`
  (maps to `prefers-reduced-motion`). When disabled, cut to end-state instantly — no partial motion.
- Focus feedback = two-layer cyan ring, never a glow alone.

## Mobile adaptation of the web brand kit
Recommendation: The brand kit was authored web-first (CSS `--citrus-console-*` variables). For the Flutter app:
- Treat those CSS variable names as source-token **history**, not runtime identifiers. Expose semantic Dart names
  (e.g. `TonaryColors.bgApp`, `TonaryColors.outlineControl`) via `ThemeData` extensions — see [../rules/flutter-rules.md](../rules/flutter-rules.md).
- Re-anchor spacing and tap targets for touch: primary actions thumb-reachable, tap targets ≥48dp
  (see [../rules/mobile-first-rules.md](../rules/mobile-first-rules.md)).
- Density drops vs. web: fewer columns, list/detail over wide tables, bottom nav over sidebars.
- Display face (Space Grotesk) stays reserved for hero/H1–H3; mobile chrome, tabs, and badges use the UI face (Inter).

Open Question: Do we ship any spectrogram/waveform live-render visuals at launch, or use static motif illustrations first?
Recommendation: Start with static motif illustrations; add live renders only where they inform a real decision.
