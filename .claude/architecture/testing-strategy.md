# Testing Strategy — Tonary

The test approach for the Tonary Flutter app. Parent:
[flutter-mobile-architecture.md](./flutter-mobile-architecture.md). Ties to
[state-management.md](./state-management.md) and [data-layer.md](./data-layer.md).

## Test pyramid

```
        /\        Integration (few)  — key user flows on device/emulator
       /  \       Golden (targeted)  — design_system components, light+dark
      /----\      Widget (many)      — feature screens & states
     /------\     Unit (most)        — domain, mappers, services, providers
```

Bias toward the base: most confidence comes from fast unit tests over the domain,
mappers, and providers; a smaller band of widget tests; targeted goldens; a thin top
of integration tests over the flows that must never break.

## Layers

### Unit tests (most) — `test/`

Cover the layers with logic and no Flutter dependency:

- **Domain models & pure logic** (`shared/models/`, `core/utils/`) — construction,
  equality, derived values, enum parsing (`PluginTier`, `PluginType`).
- **Mappers** (`data/mappers/`) — DTO ⇄ domain, including legacy `manifest.json` field
  normalization and null/edge handling. **High priority — this is where source data
  reconciliation lives.**
- **Repositories** — against an **in-memory Drift** database; verify queries, filters,
  and Failure mapping without touching real files/network.
- **Services** (`core/services/`) — the `AiClient` against a fake proxy; retrieval
  ranking logic; the **seed hydrator** (idempotency + `seedVersion` gating).
- **Providers** — via `ProviderContainer` with repository overrides; assert
  `AsyncValue` state sequences (see [state-management.md](./state-management.md)).

### Widget tests (many) — `test/features/...`

- Each feature screen: loading / data / empty / error states rendered from overridden
  providers (`ProviderScope(overrides: [...])`).
- User intent: taps, filters, navigation intent (route pushed) — no real repositories.
- Accessibility smoke: semantics labels present, tap targets ≥ 48dp, text scales.

### Golden tests (targeted) — `test/design_system/...`

- `design_system/components/` — branded buttons, cards, chips, inputs, nav bar.
- **Dark-first** rendering; capture the primary dark theme (and any secondary surface
  states). Verify the **color law** visually: violet only on brand-action, light label
  (`#f4f2fb`) on the filled violet brand button, violet focus ring (two-layer), correct surface tokens.
- **Recommendation:** use `alchemist` or `golden_toolkit` for stable cross-platform
  goldens; pin fonts (Inter / Space Grotesk / IBM Plex Mono) so goldens are
  deterministic. Keep goldens for components, not whole screens (screens churn).

### Integration tests (few) — `integration_test/`

Key end-to-end flows on emulator/device, network stubbed:

1. **Cold start offline** — install → seed hydrates → Vault browsable (offline proof;
   see [offline-first-strategy.md](./offline-first-strategy.md)).
2. **Vault recall** — open a plugin → view presets → open its Review sources.
3. **Search** — query → filter → open a result.
4. **Scout retrieval** — ask → ranked local matches render (no network).
5. **Save flow** — save an item → appears on Home → persists across restart.

## Coverage expectations

**Recommendation (starter targets, not dogma):**

| Layer | Target | Rationale |
|-------|--------|-----------|
| Mappers + domain | ~90%+ | Pure, cheap, high-value; data correctness |
| Repositories + services | ~80% | Core behavior incl. Failure paths |
| Providers | ~80% | State transitions matter |
| Feature widgets | ~60% | States + key interactions, not pixels |
| design_system | goldens over % | Visual truth beats line coverage |

Track overall line coverage but gate on **critical-path** layers (mappers, repos,
providers, offline hydrate) rather than a blanket number.

## Where tests live & conventions

```
test/
├── core/            # utils, services, seed hydrator
├── data/            # mappers, repositories (in-memory Drift)
├── features/<name>/ # widget tests per feature
├── design_system/   # golden tests
└── fakes/           # FakeVaultRepository, FakeAiClient, test fixtures
integration_test/    # end-to-end flows
```

- **Naming:** mirror `lib/` path; file `<subject>_test.dart`.
- **Fakes over mocks** for repositories/services (in-memory, deterministic); use
  `mocktail` only where interaction verification is genuinely needed.
- **Fixtures:** small seed JSON samples under `test/fakes/` — never the full dataset.
- **No real network** in unit/widget/integration; the `AiClient` is always faked.

## CI

**Recommendation:** on every PR run `flutter analyze`, `dart format --set-exit-if-changed`,
`flutter test --coverage`, and the golden suite; run `integration_test` on a matrix
(one iOS sim + one Android emulator) nightly or on merge to main to keep PRs fast.
Fail the build on analyzer errors, failing goldens, or a drop below critical-path
coverage gates. **Open Question:** CI provider (GitHub Actions vs Codemagic vs
Bitrise) — undecided; the commands above are provider-agnostic.
