// Widget test for Settings: the grounded sections render, the dataset summary
// reflects the seeded records, and accessibility shows live system status.

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
  testWidgets('renders grounded sections and a real dataset summary', (
    tester,
  ) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Settings').first);
    await tester.pumpAndSettle();

    for (final section in ['APPEARANCE', 'DATASET', 'ACCESSIBILITY', 'ABOUT']) {
      expect(find.text(section), findsOneWidget, reason: 'missing $section');
    }
    // Real values — not fabricated.
    expect(find.text('v2'), findsOneWidget); // kSeedVersion
    expect(find.textContaining('2 plugins'), findsOneWidget);
    // Live accessibility status (test env: animations enabled, scale 100%).
    expect(find.text('Off'), findsOneWidget); // reduced motion
    expect(find.text('100%'), findsOneWidget); // text size
    // Legal gate #3: non-affiliation disclaimer is present.
    expect(find.text('Not affiliated'), findsOneWidget);
    expect(find.textContaining('trademarks'), findsOneWidget);
  });
}
