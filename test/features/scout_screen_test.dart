// Widget tests for the Scout flow: prompt state + facet chips, selecting a
// facet to get ranked matches with a transparent "why", and clearing.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

Plugin _plugin(
  String id,
  String name, {
  String category = 'Synth',
  List<String> tags = const ['bass'],
  List<String> capabilities = const ['presets'],
}) => Plugin(
  id: id,
  name: name,
  vendor: 'Image-Line',
  category: category,
  type: PluginType.generator,
  tier: PluginTier.free,
  description: 'A $name plugin.',
  tags: tags,
  capabilities: capabilities,
  sources: const ['src-a', 'src-b'],
);

class _FakeVaultRepository implements VaultRepository {
  @override
  Future<List<Plugin>> listPlugins() async => [
    _plugin('flex', 'FLEX'),
    _plugin('sytrus', 'Sytrus', tags: const ['bass', 'fm']),
    _plugin(
      'eq2',
      'Fruity Parametric EQ 2',
      category: 'EQ',
      tags: const ['mixing'],
    ),
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

Future<void> _openScout(WidgetTester tester) async {
  await tester.tap(find.text('Scout').first);
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows the prompt state and facet chips', (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openScout(tester);

    expect(find.textContaining('going for'), findsWidgets);
    // A facet derived from the seed data is offered as a chip.
    expect(find.widgetWithText(FilterChip, 'EQ'), findsOneWidget);
    expect(find.widgetWithText(FilterChip, 'bass'), findsOneWidget);
  });

  testWidgets('selecting a facet produces ranked matches with a reason', (
    tester,
  ) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openScout(tester);

    await tester.ensureVisible(find.widgetWithText(FilterChip, 'bass'));
    await tester.tap(find.widgetWithText(FilterChip, 'bass'));
    await tester.pumpAndSettle();

    // Both bass plugins match; the EQ (mixing) does not.
    expect(find.text('FLEX'), findsOneWidget);
    expect(find.text('Sytrus'), findsOneWidget);
    expect(find.text('Fruity Parametric EQ 2'), findsNothing);
    // Evidence is surfaced.
    expect(find.textContaining('Source Reference'), findsWidgets);
  });

  testWidgets('Clear resets the selection back to the prompt', (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openScout(tester);

    await tester.ensureVisible(find.widgetWithText(FilterChip, 'bass'));
    await tester.tap(find.widgetWithText(FilterChip, 'bass'));
    await tester.pumpAndSettle();
    expect(find.text('FLEX'), findsOneWidget);

    await tester.tap(find.text('Clear'));
    await tester.pumpAndSettle();
    expect(find.text('FLEX'), findsNothing);
    expect(find.textContaining('going for'), findsWidgets);
  });
}
