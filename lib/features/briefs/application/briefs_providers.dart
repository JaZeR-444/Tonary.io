import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/providers.dart';
import '../../../shared/models/models.dart';
import '../../vault/application/vault_providers.dart';
import 'plugin_comparison.dart';

/// Which two plugins the user has chosen to compare. Either slot may be null
/// until picked; the screen shows the prompt state until both are set.
class BriefsSelection {
  const BriefsSelection({this.aId, this.bId});
  final String? aId;
  final String? bId;

  bool get isComplete => aId != null && bId != null && aId != bId;

  BriefsSelection copyWith({String? aId, String? bId}) =>
      BriefsSelection(aId: aId ?? this.aId, bId: bId ?? this.bId);
}

/// Holds the current A/B selection. Picking a plugin for one slot that already
/// occupies the other swaps them rather than comparing a plugin with itself.
class BriefsSelectionNotifier extends Notifier<BriefsSelection> {
  @override
  BriefsSelection build() => const BriefsSelection();

  void selectA(String id) => state =
      state.bId == id ? BriefsSelection(aId: id, bId: state.aId) : state.copyWith(aId: id);

  void selectB(String id) => state =
      state.aId == id ? BriefsSelection(aId: state.bId, bId: id) : state.copyWith(bId: id);

  void swap() => state = BriefsSelection(aId: state.bId, bId: state.aId);

  void clear() => state = const BriefsSelection();
}

final briefsSelectionProvider =
    NotifierProvider<BriefsSelectionNotifier, BriefsSelection>(
        BriefsSelectionNotifier.new);

/// Everything a comparison Brief renders, assembled from sourced Vault records:
/// the factual [comparison], each plugin's sound-design notes and Source
/// References (the "why"), and workflow recipes that use either plugin (the
/// "next steps"). No AI, no network.
class ComparisonData {
  const ComparisonData({
    required this.comparison,
    required this.notesA,
    required this.notesB,
    required this.sourcesA,
    required this.sourcesB,
    required this.relatedRecipes,
  });

  final PluginComparison comparison;
  final List<SoundDesignNote> notesA;
  final List<SoundDesignNote> notesB;
  final List<SourceReference> sourcesA;
  final List<SourceReference> sourcesB;
  final List<WorkflowRecipe> relatedRecipes;
}

/// Resolves a full [ComparisonData] for an ordered (aId, bId) pair.
final comparisonProvider =
    FutureProvider.autoDispose.family<ComparisonData, (String, String)>(
        (ref, pair) async {
  final repo = ref.watch(vaultRepositoryProvider);
  final (aId, bId) = pair;

  final a = await repo.pluginById(aId);
  final b = await repo.pluginById(bId);
  final notesA = await repo.notesForSubject(a.id);
  final notesB = await repo.notesForSubject(b.id);

  final recipes = await repo.listRecipes();
  final related = recipes
      .where((r) =>
          r.pluginChain.contains(a.id) || r.pluginChain.contains(b.id))
      .toList();

  Future<List<SourceReference>> resolve(List<String> ids) async =>
      [for (final id in ids) await repo.sourceById(id)];

  return ComparisonData(
    comparison: PluginComparison.build(a, b),
    notesA: notesA,
    notesB: notesB,
    sourcesA: await resolve(a.sources),
    sourcesB: await resolve(b.sources),
    relatedRecipes: related,
  );
});

/// All plugins, for the picker (reuses the Vault's offline list).
final briefsPluginsProvider = FutureProvider<List<Plugin>>(
    (ref) => ref.watch(vaultPluginsProvider.future));
