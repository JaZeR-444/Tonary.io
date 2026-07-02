# Mobile-First Rules

> Scope: Non-negotiable mobile mandates. Tonary is mobile-first Flutter (iOS + Android), offline-first.
> Inherits [global-rules.md](global-rules.md). Pairs with [flutter-rules.md](flutter-rules.md) and [ui-ux-rules.md](ui-ux-rules.md).

## Design width first
- **Design for 360–430pt logical widths first.** 360 (compact Android), 390 (iPhone), 430 (large phones) are the primary canvas.
- Never design a desktop/tablet screen and shrink it down. There are **no desktop-first screens** in Tonary.
- Tablet/large layouts are a later enhancement (two-pane list/detail), never the starting point. Recommendation: gate tablet layouts behind a width breakpoint (~600dp) and treat them as additive.

## Thumb reachability
- Primary actions live in the **thumb zone** — bottom third of the screen. The main CTA is reachable one-handed.
- Destructive or rarely-used actions go top or behind an overflow — never where a thumb rests by default.
- Avoid top-corner-only primary actions; the top area is for context/titles, not the main tap target.

## Navigation
- **Bottom navigation** is the primary app-level nav. MVP tabs: **Home, Vault, Scout, Briefs, Settings** (Review & Flow are deferred — see [../project/mvp-scope.md](../project/mvp-scope.md)). Full module set: Scout, Vault, Review, Flow, Briefs (see [../brand/ui-language.md](../brand/ui-language.md)).
- No hamburger drawer as the primary nav pattern. No desktop sidebar.
- Keep the bar to 5 items max for thumb comfort; surface Search contextually (e.g. an app-bar action / Home entry), not as a sixth tab.

## Tap targets & spacing
- **Minimum tap target 48×48dp** (Material) — enforce even when the visual glyph is smaller (use padding/hit area).
- Minimum 8dp spacing between adjacent tap targets to prevent mis-taps.
- Lists use full-width row tap targets, not tiny inline hit areas.

## Responsive technique
- Build responsive with `LayoutBuilder` and `MediaQuery`, not fixed pixel sizes. Use flex, `Expanded`, `Wrap`.
- Text scales with the user's system font-size setting; never hardcode heights that clip scaled text. Test at 1.3× text scale.
- Respect orientation: primary flows must work in portrait; landscape must not break layout.

## Safe areas & insets
- Wrap screens in `SafeArea` (or handle `MediaQuery.viewPadding`) for notches, home indicators, and status bars.
- Account for the on-screen keyboard: use `resizeToAvoidBottomInset` / `viewInsets` so inputs stay visible; scroll content above the keyboard.
- Bottom nav and bottom CTAs respect the home-indicator inset (don't sit flush against the edge).

## Offline-first behavior
- Screens must render meaningful state without a network. Show local/cached data first; sync in the background.
- Never block a screen on a network call. Offline is a normal state, not an error (see [../brand/voice-and-tone.md](../brand/voice-and-tone.md)).

## Performance on device
- Target smooth 60fps on mid-range phones. Prefer `const` widgets, lazy `ListView.builder`, and image caching.
- Avoid heavy synchronous work on the UI isolate; offload parsing/seeding to background isolates where needed.

Open Question: Do we support tablet split-view at launch or defer? Recommendation: defer — ship phone-perfect first, add tablet later.
