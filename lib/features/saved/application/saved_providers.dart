import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/providers.dart';
import '../../../core/errors/failure.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/models/models.dart';

/// All User Saved Items, newest first (offline, from the local DB).
final savedItemsProvider = FutureProvider<List<SavedItem>>(
    (ref) => ref.watch(savedItemsRepositoryProvider).listSaved());

/// The saved *plugins*, resolved to full records for the Saved list. Silently
/// skips any saved id whose record is missing (e.g. removed in a seed bump) —
/// never fabricates a placeholder.
final savedPluginsProvider = FutureProvider<List<Plugin>>((ref) async {
  final items = await ref.watch(savedItemsProvider.future);
  final repo = ref.watch(vaultRepositoryProvider);
  final plugins = <Plugin>[];
  for (final item in items) {
    if (item.refType != SavedItemRefType.plugin) continue;
    try {
      plugins.add(await repo.pluginById(item.refId));
    } on NotFoundFailure {
      // Saved record points at data no longer present — skip, don't invent.
    }
  }
  return plugins;
});

/// Whether a given plugin is currently saved. Derived from [savedItemsProvider]
/// so toggling one refreshes all.
final isPluginSavedProvider = FutureProvider.family<bool, String>((ref, id) async {
  final items = await ref.watch(savedItemsProvider.future);
  return items.any(
      (i) => i.refType == SavedItemRefType.plugin && i.refId == id);
});

/// Mutations for saved items. Keeps storage writes out of the widget layer.
class SavedItemsController {
  SavedItemsController(this._ref);
  final Ref _ref;

  Future<void> togglePlugin(String id) async {
    final repo = _ref.read(savedItemsRepositoryProvider);
    if (await repo.isSaved(SavedItemRefType.plugin, id)) {
      await repo.unsave(SavedItemRefType.plugin, id);
    } else {
      await repo.save(SavedItemRefType.plugin, id);
    }
    _ref.invalidate(savedItemsProvider);
  }
}

final savedItemsControllerProvider =
    Provider<SavedItemsController>((ref) => SavedItemsController(ref));
