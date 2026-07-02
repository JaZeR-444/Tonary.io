// Widget tests for the Tonary app shell and the Vault UI. The Vault screen
// reads a repository, so tests override it with an in-memory fake (no native
// SQLite needed).

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

class _FakeVaultRepository implements VaultRepository {
  _FakeVaultRepository(this.plugins);
  final List<Plugin> plugins;

  @override
  Future<List<Plugin>> listPlugins() async => plugins;

  @override
  Future<Plugin> pluginById(String id) async =>
      plugins.firstWhere((p) => p.id == id);

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
        title: 'Stub source $id',
        sourceType: SourceType.officialManual,
        retrievedAt: '2026-07-02',
        reliability: Reliability.high,
      );
}

Plugin _plugin(String id, String name) => Plugin(
      id: id,
      name: name,
      vendor: 'Image-Line',
      category: 'Synth',
      type: PluginType.generator,
      tier: PluginTier.free,
      description: 'A $name plugin.',
      tags: const ['synth'],
      capabilities: const ['presets'],
      sources: const ['src-x'],
    );

Widget _app(VaultRepository repo) => ProviderScope(
      overrides: [vaultRepositoryProvider.overrideWithValue(repo)],
      child: const TonaryApp(),
    );

void main() {
  testWidgets('boots to Home with the MVP bottom-nav tabs', (tester) async {
    await tester.pumpWidget(_app(_FakeVaultRepository(const [])));
    await tester.pumpAndSettle();

    expect(find.text('Your dark-first sound-design intelligence layer.'),
        findsOneWidget);
    for (final label in ['Home', 'Vault', 'Scout', 'Briefs', 'Settings']) {
      expect(find.text(label), findsWidgets, reason: 'missing tab: $label');
    }
  });

  testWidgets('Vault lists seeded plugins and opens a detail screen',
      (tester) async {
    final repo = _FakeVaultRepository([
      _plugin('flex', 'FLEX'),
      _plugin('fruity-parametric-eq-2', 'Fruity Parametric EQ 2'),
    ]);
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();

    // Go to Vault.
    await tester.tap(find.text('Vault').first);
    await tester.pumpAndSettle();
    expect(find.text('FLEX'), findsOneWidget);
    expect(find.text('Fruity Parametric EQ 2'), findsOneWidget);

    // Open the FLEX detail.
    await tester.tap(find.text('FLEX'));
    await tester.pumpAndSettle();
    expect(find.text('A FLEX plugin.'), findsOneWidget); // description
    expect(find.text('CATEGORY'), findsOneWidget); // a detail section header
  });

  testWidgets('Vault shows the empty state when there are no plugins',
      (tester) async {
    await tester.pumpWidget(_app(_FakeVaultRepository(const [])));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Vault').first);
    await tester.pumpAndSettle();
    expect(find.text('No plugins yet'), findsOneWidget);
  });
}
