// Widget tests for the Search flow: open from the Vault app bar, prompt state,
// live results, no-results state, and navigation into a plugin detail. Uses an
// in-memory fake repository (no native SQLite).

import 'package:flutter/material.dart';
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

Plugin _plugin(
  String id,
  String name, {
  String category = 'Synth',
  List<String> tags = const [],
}) => Plugin(
  id: id,
  name: name,
  vendor: 'Image-Line',
  category: category,
  type: PluginType.generator,
  tier: PluginTier.free,
  description: 'A $name plugin.',
  tags: tags,
  capabilities: const ['presets'],
  sources: const ['src-x'],
);

Widget _app(VaultRepository repo) => ProviderScope(
  overrides: [vaultRepositoryProvider.overrideWithValue(repo)],
  child: const TonaryApp(),
);

Future<void> _openSearch(WidgetTester tester) async {
  await tester.tap(find.text('Vault').first);
  await tester.pumpAndSettle();
  await tester.tap(find.byIcon(Icons.search));
  await tester.pumpAndSettle();
}

void main() {
  final repo = _FakeVaultRepository([
    _plugin('flex', 'FLEX', tags: const ['rompler']),
    _plugin('sytrus', 'Sytrus', tags: const ['fm', 'bass']),
    _plugin('fruity-parametric-eq-2', 'Fruity Parametric EQ 2', category: 'EQ'),
  ]);

  testWidgets('opens from Vault and shows the prompt state before typing', (
    tester,
  ) async {
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();
    await _openSearch(tester);

    expect(find.text('Search the Vault'), findsOneWidget);
    // No result rows yet.
    expect(find.text('FLEX'), findsNothing);
  });

  testWidgets('filters plugins live as the query is typed', (tester) async {
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();
    await _openSearch(tester);

    await tester.enterText(find.byType(TextField), 'sytr');
    await tester.pumpAndSettle();

    expect(find.text('Sytrus'), findsOneWidget);
    expect(find.text('FLEX'), findsNothing);
    expect(find.text('Fruity Parametric EQ 2'), findsNothing);
  });

  testWidgets('shows the no-results state for an unmatched query', (
    tester,
  ) async {
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();
    await _openSearch(tester);

    await tester.enterText(find.byType(TextField), 'zzz-nope');
    await tester.pumpAndSettle();

    expect(find.textContaining('No matches'), findsOneWidget);
  });

  testWidgets('tapping a result opens the plugin detail', (tester) async {
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();
    await _openSearch(tester);

    await tester.enterText(find.byType(TextField), 'flex');
    await tester.pumpAndSettle();
    await tester.tap(find.text('FLEX'));
    await tester.pumpAndSettle();

    expect(find.text('A FLEX plugin.'), findsOneWidget); // detail description
  });
}
