// Widget tests for the Briefs comparison flow: prompt state, picking A and B
// via the bottom-sheet picker, and the assembled Brief (table, why sections
// with sources, next-step recipes). Uses an in-memory fake repository.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/app/bootstrap/providers.dart';
import 'package:tonary/app/tonary_app.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

Plugin _plugin(String id, String name,
        {String category = 'Synth',
        PluginTier tier = PluginTier.free,
        List<String> tags = const ['bass']}) =>
    Plugin(
      id: id,
      name: name,
      vendor: 'Image-Line',
      category: category,
      type: PluginType.generator,
      tier: tier,
      description: 'A $name plugin.',
      tags: tags,
      capabilities: const ['presets'],
      sources: ['src-$name'],
    );

class _FakeVaultRepository implements VaultRepository {
  @override
  Future<List<Plugin>> listPlugins() async => [
        _plugin('flex', 'FLEX'),
        _plugin('sytrus', 'Sytrus', tier: PluginTier.premium),
        _plugin('eq2', 'Fruity Parametric EQ 2', category: 'EQ'),
      ];

  @override
  Future<Plugin> pluginById(String id) async =>
      (await listPlugins()).firstWhere((p) => p.id == id);

  @override
  Future<List<Preset>> presetsForPlugin(String pluginId) async => const [];

  @override
  Future<List<WorkflowRecipe>> listRecipes() async => [
        WorkflowRecipe(
          id: 'warm-analog-bass-flex',
          title: 'Warm Analog Bass',
          goal: 'A round sub-heavy bass with FLEX.',
          pluginChain: const ['flex'],
          steps: const [WorkflowStep(order: 1, action: 'Load a bass preset.')],
          difficulty: Difficulty.beginner,
          timeEstimate: '10 min',
          genreTags: const ['house'],
          sources: const ['src-FLEX'],
        ),
      ];

  @override
  Future<List<SoundDesignNote>> notesForSubject(String subjectId) async =>
      subjectId == 'flex'
          ? [
              SoundDesignNote(
                id: 'flex-macro-note',
                topic: 'Macro locking',
                subjectRefs: const ['flex'],
                body: 'Lock macros before automating.',
                evidenceLevel: EvidenceLevel.documented,
                sources: const ['src-FLEX'],
                createdAt: '2026-07-02',
              ),
            ]
          : const [];

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

Future<void> _openBriefs(WidgetTester tester) async {
  await tester.tap(find.text('Briefs').first);
  await tester.pumpAndSettle();
}

Future<void> _pick(WidgetTester tester, String pluginName) async {
  await tester.tap(find.text('Choose plugin').first);
  await tester.pumpAndSettle();
  await tester.tap(find.text(pluginName).last); // the sheet's ListTile
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows the prompt state before both slots are chosen',
      (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openBriefs(tester);

    expect(find.text('Compare two plugins'), findsOneWidget);
    expect(find.text('Choose plugin'), findsNWidgets(2));
  });

  testWidgets('builds a Brief after picking two plugins', (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openBriefs(tester);

    await _pick(tester, 'FLEX');
    await _pick(tester, 'Sytrus');

    // Evidence-backed "why" sections for both plugins.
    expect(find.text('WHY FLEX'), findsOneWidget);
    expect(find.text('WHY SYTRUS'), findsOneWidget);
    // A sound-design note surfaced for FLEX.
    expect(find.text('Macro locking'), findsOneWidget);
    // Next-step recipe that uses FLEX.
    expect(find.text('Warm Analog Bass'), findsOneWidget);
    // A cited source badge.
    expect(find.textContaining('Manual'), findsWidgets);
  });

  testWidgets('the same plugin cannot fill both slots', (tester) async {
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();
    await _openBriefs(tester);

    await _pick(tester, 'FLEX'); // slot A = FLEX

    // Opening slot B's picker must exclude FLEX. FLEX still shows in slot A
    // behind the sheet, so its count stays 1 (it is NOT added as a sheet row);
    // if the sheet wrongly offered it, the count would be 2.
    await tester.tap(find.text('Choose plugin'));
    await tester.pumpAndSettle();
    expect(find.text('FLEX'), findsOneWidget); // slot A only, not in the sheet
    expect(find.text('Sytrus'), findsOneWidget); // offered in the sheet
  });
}
