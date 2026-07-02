# State Management — Tonary

State conventions for Tonary. Parent:
[flutter-mobile-architecture.md](./flutter-mobile-architecture.md).

**Recommendation: Riverpod** (`flutter_riverpod` + `riverpod_generator`). Rationale:
compile-safe DI, no `BuildContext` for reads, painless provider overrides in tests
and bootstrap, first-class async (`AsyncNotifier`/`FutureProvider`), and natural
feature-scoping. **Alternative: Bloc** — see tradeoffs below.

## Core principle: no business logic in widgets

Widgets render state and forward intent. All logic — fetching, mapping decisions,
derived values, mutations — lives in providers/notifiers or the domain layer. A
widget may call `ref.watch(...)` and `ref.read(...).method()`; it must not query
Drift, call a service, or branch on raw data shapes.

## Where providers live

Providers are **feature-scoped**. They live with the feature that owns them:

```
features/vault/providers/vault_list_provider.dart
features/scout/providers/scout_session_provider.dart
```

Cross-feature/shared providers (e.g. the app-wide `databaseProvider`,
`seedStatusProvider`) live in `lib/core/` or `lib/app/bootstrap/`. Repository
providers that expose data to features live near the repository in `data/` or are
declared in a `providers.dart` the feature imports.

**Rule:** a feature never imports another feature's providers. Shared needs are
promoted to `shared/`/`core/`.

## Naming conventions

| Kind | Suffix | Example |
|------|--------|---------|
| Read-only derived / dependency | `Provider` | `databaseProvider`, `vaultRepositoryProvider` |
| Async fetch (no mutation) | `Provider` (FutureProvider) | `pluginDetailProvider(pluginId)` |
| Async unit with mutation methods | `Notifier`/`NotifierProvider` | `scoutSessionNotifierProvider` |
| Parameterized | `.family` / generator args | `pluginDetailProvider(pluginId)` |

- **Recommendation:** use `@riverpod` code-gen; it produces the correct provider type
  and family automatically and keeps names consistent.
- Name by *what it provides*, not its type: `savedItems`, not `savedItemsList`.

## Async data — AsyncNotifier / FutureProvider

Use `AsyncValue<T>` end to end so every screen handles loading/error/data uniformly.

```dart
@riverpod
Future<List<PluginSummary>> vaultList(VaultListRef ref) {
  return ref.watch(vaultRepositoryProvider).listPlugins();
}
```

```dart
@riverpod
class ScoutSession extends _$ScoutSession {
  @override
  Future<ScoutResult?> build() async => null; // idle

  Future<void> ask(String prompt) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(scoutServiceProvider).recommend(prompt),
    );
  }
}
```

Widgets render with `.when(data/error/loading)` or `AsyncValueWidget` from
`shared/widgets/`. `AsyncValue.guard` funnels exceptions into typed `Failure`s from
`core/errors/`.

## Repository access pattern

Providers depend on **repository interfaces**, not concrete sources. This keeps
domain logic testable and lets the future remote source (see
[data-layer.md](./data-layer.md)) slot in behind the same interface without touching
providers or widgets.

## Testing providers

- Use `ProviderContainer` (unit) or `ProviderScope(overrides: [...])` (widget tests).
- **Override the repository provider** with a fake/in-memory implementation — no real
  Drift or network in unit tests.
- Assert on the sequence of `AsyncValue` states (loading → data / loading → error).
- Fakes live under `test/fakes/`. See [testing-strategy.md](./testing-strategy.md).

```dart
final container = ProviderContainer(overrides: [
  vaultRepositoryProvider.overrideWithValue(FakeVaultRepository()),
]);
addTearDown(container.dispose);
```

## Bloc as an alternative

**Alternative: Bloc/Cubit.** Tradeoffs vs the Riverpod recommendation:

| Dimension | Riverpod (recommended) | Bloc |
|-----------|------------------------|------|
| Boilerplate | Low (esp. with code-gen) | Higher (events + states + mapping) |
| DI / overrides | Built-in, test-friendly | Needs `RepositoryProvider`/get_it |
| Async ergonomics | `AsyncValue` native | Manual state classes or hydrated_bloc |
| Event traceability | Implicit | Explicit event log (a plus for complex flows) |
| Team familiarity | Growing | Very common |

Choose Bloc only if a feature has genuinely complex, event-driven state where an
explicit event stream aids reasoning (e.g. a multi-step Scout wizard). **Do not mix
paradigms within one feature.**

## Do / Don't

- Do keep providers small and composable; derive rather than duplicate state.
- Do dispose/auto-dispose transient providers (`@Riverpod(keepAlive: false)` default).
- Don't store `BuildContext`, widgets, or `Failure` UI copy in providers.
- Don't perform navigation from a provider — return state; the widget/router reacts.
