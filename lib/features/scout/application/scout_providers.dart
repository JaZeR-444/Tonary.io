import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/models.dart';
import '../../vault/application/vault_providers.dart';
import 'scout_matcher.dart';

/// The set of intent facets the user has toggled on. A new Set is emitted on
/// every change so Riverpod sees the update.
class ScoutSelectionNotifier extends Notifier<Set<ScoutFacet>> {
  @override
  Set<ScoutFacet> build() => const {};

  void toggle(ScoutFacet facet) {
    final next = Set<ScoutFacet>.from(state);
    if (!next.remove(facet)) next.add(facet);
    state = next;
  }

  void clear() => state = const {};
}

final scoutSelectionProvider =
    NotifierProvider<ScoutSelectionNotifier, Set<ScoutFacet>>(
      ScoutSelectionNotifier.new,
    );

/// The pickable facets, derived from the seeded plugins (offline, no fabrication).
final scoutFacetsProvider = FutureProvider<List<ScoutFacet>>((ref) async {
  final plugins = await ref.watch(vaultPluginsProvider.future);
  return ScoutMatcher.facetsFor(plugins);
});

/// Ranked recommendations for the current selection. Maps loading/error from the
/// underlying plugin list; data is the ranked, transparent match list.
final scoutResultsProvider = Provider<AsyncValue<List<ScoutMatch>>>((ref) {
  final plugins = ref.watch(vaultPluginsProvider);
  final selected = ref.watch(scoutSelectionProvider);
  return plugins.whenData((list) => ScoutMatcher.recommend(list, selected));
});

/// Convenience: all plugins for the empty/loading gate on the Scout screen.
final scoutPluginsProvider = FutureProvider<List<Plugin>>(
  (ref) => ref.watch(vaultPluginsProvider.future),
);
