# Navigation Architecture — Tonary

Mobile-first navigation for Tonary. Parent:
[flutter-mobile-architecture.md](./flutter-mobile-architecture.md). Folder home:
`lib/app/router/`.

**Recommendation: go_router** (declarative, deep-link ready, official) with a
**`StatefulShellRoute.indexedStack`** bottom-nav shell so each tab keeps its own
navigation stack and scroll state.

## Bottom navigation (mobile-first)

Producers reach for Tonary one-handed, mid-session. A bottom nav bar is the primary
navigation. **Recommendation: 5 primary tabs** — thumb-reachable, no hamburger menu.

| Tab | Route | Module | Why primary |
|-----|-------|--------|-------------|
| Home | `/home` | Launchpad | Entry, recent, saved |
| Vault | `/vault` | Tonary Vault | Core browse/recall surface |
| Scout | `/scout` | Tonary Scout | The intelligence hook |
| Flow | `/flow` | Tonary Flow | Workflow recipes |
| Search | `/search` | Global search | Fast cross-record lookup |

**Recommendation:** keep **Review** and **Briefs** one level in rather than as tabs —
Review is reached from a Vault record ("see sources"), and a Brief is generated/opened
in context from Scout, Vault, or Search. Five tabs is the mobile sweet spot; a sixth
crowds the thumb zone. Settings lives behind a Home app-bar icon, not a tab.

## Route table

```
/onboarding                         # first-run only (guarded), full-screen, no shell
/                                   # redirect → /home
── StatefulShellRoute (bottom nav) ─────────────────────────
/home
  /home/settings                    # pushed above shell (or top-level, see below)
/vault
  /vault/plugin/:pluginId           # Plugin Record detail
  /vault/preset/:presetId           # Preset Record detail
  /vault/chain/:chainId             # saved chain detail
  /vault/plugin/:pluginId/review    # → Tonary Review for that record
/scout
  /scout/result/:sessionId          # a Scout recommendation result
  /scout/brief/:briefId             # → Tonary Briefs (generated)
/flow
  /flow/recipe/:recipeId            # Workflow Recipe detail
/search
  /search?q=<term>&type=<record>    # query-param driven results
────────────────────────────────────────────────────────────
/settings                           # top-level, full-screen (also linked from Home)
/briefs/:briefId                    # top-level deep-link target for a Brief
/review/:sourceId                   # top-level deep-link target for a source
```

**Recommendation:** expose Briefs/Review as **both** contextual sub-routes (for
in-app breadcrumbing) and **top-level deep-link targets** so a shared link opens
directly. go_router handles both via distinct path entries mapping to the same
screens.

## StatefulShellRoute for tab state

```dart
StatefulShellRoute.indexedStack(
  builder: (context, state, shell) => TonaryScaffold(shell: shell),
  branches: [
    StatefulShellBranch(routes: [ /* /home ... */ ]),
    StatefulShellBranch(routes: [ /* /vault ... */ ]),
    StatefulShellBranch(routes: [ /* /scout ... */ ]),
    StatefulShellBranch(routes: [ /* /flow ... */ ]),
    StatefulShellBranch(routes: [ /* /search ... */ ]),
  ],
);
```

`TonaryScaffold` renders the branch child plus a branded bottom `NavigationBar`
(active tab uses the **cyan** focus role, not amber — amber stays brand-action only).
`indexedStack` preserves each tab's stack and scroll position when switching.

## Deep linking

- **Scheme + universal links:** `tonary://` custom scheme and `https://tonary.io/...`
  app links map 1:1 to the route table above (e.g. `tonary://vault/plugin/serum`).
- go_router parses the incoming URI → the matching route → screen with parsed params.
- Deep links that require onboarding pass through the onboarding guard first, then
  redirect to the original target.
- **Open Question:** universal-link domain verification (Apple App Site Association /
  Android assetlinks.json) depends on the final hosting/backend decision — deferred.

## Guarded routes

Guards use go_router's `redirect`. Guard state comes from Riverpod providers (see
[state-management.md](./state-management.md)); the router listens via
`refreshListenable`.

| Guard | Rule |
|-------|------|
| Onboarding | If first-run incomplete → force `/onboarding`; block all other routes. |
| Seed-ready | If Drift not yet hydrated → hold on a splash/bootstrap screen. |
| Deep-link fallthrough | Unknown/invalid IDs → branded 404 screen within the shell. |

**Open Question:** user accounts/auth are not yet in scope (no backend chosen). No
auth guard is defined; add an `authGuard` behind the same `redirect` pattern when a
backend is selected.

## Conventions

- **Recommendation:** centralize path + name constants in `lib/app/router/routes.dart`;
  navigate by **named** routes (`context.goNamed(Routes.vaultPlugin, ...)`) — never
  hand-typed strings.
- Push vs go: use `go` for tab-root navigation, `push` for drill-in detail so the OS
  back gesture pops correctly.
- Motion: transitions honor brand motion tokens (base 180ms / panel 260ms) and
  `MediaQuery.disableAnimations` (reduced-motion).
- Every route maps to exactly one screen widget under `features/<name>/presentation/`.
