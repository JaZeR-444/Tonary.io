// Widget tests for the save/favorite flow: bookmark toggle on plugin detail
// and the Saved screen listing saved plugins. In-memory fakes, no SQLite.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/saved_items_repository.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

Plugin _plugin(String id, String name) => Plugin(
      id: id,
      name: name,
      vendor: 'Image-Line',
      category: 'Synth',
      type: PluginType.generator,
      tier: PluginTier.free,
      description: 'A $name plugin.',
      tags: const ['bass'],
      capabilities: const ['presets'],
      sources: const ['src-x'],
    );

class _FakeVaultRepository implements VaultRepository {
  @override
  Future<List<Plugin>> listPlugins() async => [_plugin('flex', 'FLEX')];
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
        title: '$id Manual',
        sourceType: SourceType.officialManual,
        retrievedAt: '2026-07-02',
        reliability: Reliability.high,
      );
}

class _FakeSaved implements SavedItemsRepository {
  final List<SavedItem> items = [];

  @override
  Future<List<SavedItem>> listSaved() async => items;
  @override
  Future<bool> isSaved(SavedItemRefType t, String id) async =>
      items.any((i) => i.refType == t && i.refId == id);
  @override
  Future<void> save(SavedItemRefType t, String id) async {
    if (!await isSaved(t, id)) {
      items.add(SavedItem(refType: t, refId: id, savedAt: '2026-07-02'));
    }
  }

  @override
  Future<void> unsave(SavedItemRefType t, String id) async =>
      items.removeWhere((i) => i.refType == t && i.refId == id);
}

Widget _app(_FakeSaved saved) => ProviderScope(
      overrides: [
        vaultRepositoryProvider.overrideWithValue(_FakeVaultRepository()),
        savedItemsRepositoryProvider.overrideWithValue(saved),
      ],
      child: const TonaryApp(),
    );

void main() {
  testWidgets('bookmark on detail toggles saved state', (tester) async {
    final saved = _FakeSaved();
    await tester.pumpWidget(_app(saved));
    await tester.pumpAndSettle();

    // Home → Vault → FLEX detail.
    await tester.tap(find.text('Vault').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('FLEX'));
    await tester.pumpAndSettle();

    // Not saved yet (tooltip is unique to the detail action).
    expect(find.byTooltip('Save'), findsOneWidget);
    await tester.tap(find.byTooltip('Save'));
    await tester.pumpAndSettle();

    expect(find.byTooltip('Saved'), findsOneWidget);
    expect(saved.items.map((i) => i.refId), contains('flex'));
  });

  testWidgets('Saved screen lists saved plugins', (tester) async {
    final saved = _FakeSaved()
      ..items.add(const SavedItem(
          refType: SavedItemRefType.plugin,
          refId: 'flex',
          savedAt: '2026-07-02'));
    // Tall surface so all Home cards render (the list is lazy).
    await tester.binding.setSurfaceSize(const Size(400, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_app(saved));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Saved')); // Home card
    await tester.pumpAndSettle();

    expect(find.text('FLEX'), findsOneWidget);
  });

  testWidgets('Saved screen shows the empty state when nothing is saved',
      (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_app(_FakeSaved()));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Saved'));
    await tester.pumpAndSettle();

    expect(find.text('No saved items yet'), findsOneWidget);
  });
}
