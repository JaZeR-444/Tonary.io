// Widget tests for the Home hub: branded header + tagline, the offline dataset
// stat, module cards, and navigation into a module.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
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
  Future<List<Plugin>> listPlugins() async => [
    _plugin('flex', 'FLEX'),
    _plugin('sytrus', 'Sytrus'),
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
    title: '$id Manual',
    sourceType: SourceType.officialManual,
    retrievedAt: '2026-07-02',
    reliability: Reliability.high,
  );
}

Widget _app() => ProviderScope(
  overrides: [
    vaultRepositoryProvider.overrideWithValue(_FakeVaultRepository()),
  ],
  child: const TonaryApp(),
);

void main() {
  testWidgets('renders the hero, dataset stat, and module cards', (
    tester,
  ) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    expect(
      find.text('Your dark-first sound-design intelligence layer.'),
      findsOneWidget,
    );
    // Offline dataset count reflects the seeded plugins.
    expect(find.textContaining('2 plugins indexed'), findsOneWidget);
    // Module cards for the shipped modules (titles also appear in the nav bar).
    for (final m in ['Vault', 'Scout', 'Briefs', 'Search']) {
      expect(find.text(m), findsWidgets, reason: 'missing module card: $m');
    }
  });

  testWidgets('a module card navigates into that module', (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    // 'Search' is not a bottom-nav tab, so its only occurrence is the Home card.
    await tester.tap(find.text('Search'));
    await tester.pumpAndSettle();
    expect(
      find.text('Search the Vault'),
      findsOneWidget,
    ); // Search prompt state
  });
}
