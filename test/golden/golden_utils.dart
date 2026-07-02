import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/app_meta_repository.dart';
import 'package:tonary/data/repositories/saved_items_repository.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

/// A representative phone canvas for goldens — 390pt logical width (iPhone),
/// dark theme (the app is dark-pinned). DPR 1 keeps the reference PNGs small.
const goldenPhoneSize = Size(390, 844);

/// Loads the bundled brand fonts so golden snapshots render real Inter / Space
/// Grotesk / IBM Plex Mono instead of the test-fallback glyphs.
Future<void> loadTonaryFonts() async {
  const families = <String, List<String>>{
    'Inter': ['assets/fonts/Inter-Variable.ttf'],
    'Space Grotesk': ['assets/fonts/SpaceGrotesk-Variable.ttf'],
    'IBM Plex Mono': [
      'assets/fonts/IBMPlexMono-Regular.ttf',
      'assets/fonts/IBMPlexMono-Medium.ttf',
    ],
  };
  for (final entry in families.entries) {
    final loader = FontLoader(entry.key);
    for (final path in entry.value) {
      loader.addFont(rootBundle.load(path));
    }
    await loader.load();
  }

  // Also load Material Icons so glyphs render in goldens instead of tofu boxes.
  try {
    await (FontLoader('MaterialIcons')
          ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf')))
        .load();
  } catch (_) {
    // Path unavailable in this environment — icons fall back to boxes.
  }
}

/// Applies the golden phone canvas to [tester] and restores it afterwards.
void useGoldenCanvas(WidgetTester tester) {
  tester.view.physicalSize = goldenPhoneSize;
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Plugin _plugin(String id, String name,
        {String category = 'Synth',
        PluginTier tier = PluginTier.free,
        List<String> tags = const ['bass', 'lead']}) =>
    Plugin(
      id: id,
      name: name,
      vendor: 'Image-Line',
      category: category,
      type: PluginType.generator,
      tier: tier,
      description: 'A curated $name plugin record, sourced and offline.',
      tags: tags,
      capabilities: const ['presets', 'modulation'],
      sources: const ['src-manual', 'src-dive'],
    );

/// Deterministic in-memory Vault for goldens — stable content, no DB.
class GoldenVaultRepository implements VaultRepository {
  @override
  Future<List<Plugin>> listPlugins() async => [
        _plugin('flex', 'FLEX'),
        _plugin('sytrus', 'Sytrus', tier: PluginTier.premium),
        _plugin('fruity-parametric-eq-2', 'Fruity Parametric EQ 2',
            category: 'EQ', tags: const ['mixing']),
      ];

  @override
  Future<Plugin> pluginById(String id) async =>
      (await listPlugins()).firstWhere((p) => p.id == id);

  @override
  Future<List<Preset>> presetsForPlugin(String pluginId) async => const [];

  @override
  Future<List<WorkflowRecipe>> listRecipes() async => const [];

  @override
  Future<List<SoundDesignNote>> notesForSubject(String subjectId) async =>
      const [];

  @override
  Future<SourceReference> sourceById(String id) async => SourceReference(
        id: id,
        title: '$id reference',
        sourceType: SourceType.officialManual,
        retrievedAt: '2026-07-02',
        reliability: Reliability.high,
      );
}

class _FakeAppMeta implements AppMetaRepository {
  final Map<String, String> store = {};
  @override
  Future<String?> get(String key) async => store[key];
  @override
  Future<void> set(String key, String value) async => store[key] = value;
}

class _FakeSaved implements SavedItemsRepository {
  @override
  Future<List<SavedItem>> listSaved() async => const [];
  @override
  Future<bool> isSaved(SavedItemRefType t, String id) async => false;
  @override
  Future<void> save(SavedItemRefType t, String id) async {}
  @override
  Future<void> unsave(SavedItemRefType t, String id) async {}
}

/// The app rooted at [initialLocation] with deterministic fakes for goldens.
Widget goldenApp(String initialLocation) => ProviderScope(
      overrides: [
        vaultRepositoryProvider.overrideWithValue(GoldenVaultRepository()),
        appMetaRepositoryProvider.overrideWithValue(_FakeAppMeta()),
        savedItemsRepositoryProvider.overrideWithValue(_FakeSaved()),
      ],
      child: TonaryApp(initialLocation: initialLocation),
    );
