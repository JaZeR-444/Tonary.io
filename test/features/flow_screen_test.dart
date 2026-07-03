// Widget tests for the Flow module: recipe list and recipe detail navigation.
// Uses an in-memory fake repository.

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
      tags: const [],
      capabilities: const [],
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
  Future<List<WorkflowRecipe>> listRecipes() async => [
        WorkflowRecipe(
          id: 'warm-bass',
          title: 'Warm Analog Bass',
          goal: 'A round, mono-safe bass.',
          pluginChain: const ['flex'],
          steps: const [
            WorkflowStep(order: 1, action: 'Load a bass preset.', tip: 'Keep it dry.'),
            WorkflowStep(order: 2, action: 'Shorten the release.'),
          ],
          difficulty: Difficulty.beginner,
          timeEstimate: 'PT10M',
          genreTags: const ['trap'],
          sources: const ['src-x'],
        ),
      ];
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

Widget _app() => ProviderScope(
      overrides: [
        vaultRepositoryProvider.overrideWithValue(_FakeVaultRepository()),
      ],
      child: const TonaryApp(),
    );

void main() {
  testWidgets('Flow lists recipes and opens a recipe detail', (tester) async {
    await tester.binding.setSurfaceSize(const Size(400, 1400));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    // Home -> Flow card.
    await tester.tap(find.text('Flow'));
    await tester.pumpAndSettle();
    expect(find.text('Warm Analog Bass'), findsOneWidget);

    // Open the recipe detail.
    await tester.tap(find.text('Warm Analog Bass'));
    await tester.pumpAndSettle();
    expect(find.text('Load a bass preset.'), findsOneWidget); // a step
    expect(find.textContaining('Tip:'), findsWidgets);
    expect(find.text('FLEX'), findsWidgets); // plugin chain chip
  });
}
