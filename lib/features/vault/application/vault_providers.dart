import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/providers.dart';
import '../../../shared/models/models.dart';

/// Async list of all plugins in the Vault (offline, from the seeded DB).
final vaultPluginsProvider = FutureProvider<List<Plugin>>((ref) {
  return ref.watch(vaultRepositoryProvider).listPlugins();
});

/// Everything a plugin detail screen needs, resolved together.
class PluginDetail {
  const PluginDetail({
    required this.plugin,
    required this.presets,
    required this.notes,
    required this.sources,
  });

  final Plugin plugin;
  final List<Preset> presets;
  final List<SoundDesignNote> notes;
  final List<SourceReference> sources;
}

/// Loads a plugin plus its presets, notes, and resolved Source References.
final pluginDetailProvider = FutureProvider.family<PluginDetail, String>((
  ref,
  id,
) async {
  final repo = ref.watch(vaultRepositoryProvider);
  final plugin = await repo.pluginById(id);
  final presets = await repo.presetsForPlugin(id);
  final notes = await repo.notesForSubject(id);
  final sources = <SourceReference>[
    for (final srcId in plugin.sources) await repo.sourceById(srcId),
  ];
  return PluginDetail(
    plugin: plugin,
    presets: presets,
    notes: notes,
    sources: sources,
  );
});
