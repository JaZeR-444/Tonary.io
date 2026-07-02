import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/repositories/vault_repository.dart';
import 'package:tonary/data/sources/drift/tonary_database.dart';
import 'package:tonary/data/sources/seed/seed_loader.dart';

/// End-to-end data-layer test on a real in-memory SQLite database: hydrate the
/// bundled seed, then read it back through the repository + mappers.
void main() {
  String read(String name) => File('assets/seed/$name').readAsStringSync();

  late TonaryDatabase db;

  setUp(() => db = TonaryDatabase.forTesting(NativeDatabase.memory()));
  tearDown(() => db.close());

  test(
    'hydrates the bundled seed and reads it back via the repository',
    () async {
      final data = SeedLoader.parse(
        sourceReferencesJson: read('source_references.json'),
        pluginsJson: read('plugins.json'),
        presetsJson: read('presets.json'),
        workflowRecipesJson: read('workflow_recipes.json'),
        soundDesignNotesJson: read('sound_design_notes.json'),
      );

      await SeedLoader(db).hydrate(data, seedVersion: 1);

      final repo = VaultRepositoryImpl(db);

      final plugins = await repo.listPlugins();
      expect(plugins.map((p) => p.id), contains('flex'));

      final flex = await repo.pluginById('flex');
      expect(flex.name, 'FLEX');
      expect(flex.tags, isNotEmpty);
      expect(flex.sources, contains('src-flex-manual'));

      final presets = await repo.presetsForPlugin('flex');
      expect(presets, isNotEmpty);

      final notes = await repo.notesForSubject('flex');
      expect(notes, isNotEmpty);

      // Referential integrity: every plugin source resolves.
      for (final id in flex.sources) {
        final src = await repo.sourceById(id);
        expect(src.id, id);
      }
    },
  );

  test('re-hydration is idempotent (no duplicate rows)', () async {
    final data = SeedLoader.parse(
      sourceReferencesJson: read('source_references.json'),
      pluginsJson: read('plugins.json'),
      presetsJson: read('presets.json'),
      workflowRecipesJson: read('workflow_recipes.json'),
      soundDesignNotesJson: read('sound_design_notes.json'),
    );

    final loader = SeedLoader(db);
    await loader.hydrate(data, seedVersion: 1);
    await loader.hydrate(data, seedVersion: 2);

    final plugins = await VaultRepositoryImpl(db).listPlugins();
    expect(plugins.where((p) => p.id == 'flex'), hasLength(1));
  });
}
