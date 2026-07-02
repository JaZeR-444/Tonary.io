// Validates every staged migration candidate under
// .claude/outputs/migration-staging/<name>/ against the real schema validator
// BEFORE any is promoted into the shipped seed. Automatable part of OQ-12
// gate #4 (schema validity + referential integrity + no id collisions on
// promotion); the legal-content review and human sign-off are tracked in the
// staging README.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/sources/seed/seed_loader.dart';
import 'package:tonary/data/sources/seed/seed_validator.dart';

void main() {
  final stagingRoot = Directory('.claude/outputs/migration-staging');

  List<Directory> candidates() => stagingRoot
      .listSync()
      .whereType<Directory>()
      .where((d) => File('${d.path}/plugins.json').existsSync())
      .toList();

  String readOr(String path, String fallback) {
    final f = File(path);
    return f.existsSync() ? f.readAsStringSync() : fallback;
  }

  List<String> ids(String jsonArray) => (jsonDecode(jsonArray) as List)
      .map((e) => (e as Map)['id'] as String)
      .toList();

  test('staging root exists with at least one candidate', () {
    expect(stagingRoot.existsSync(), isTrue);
    expect(candidates(), isNotEmpty);
  });

  for (final dir in candidates()) {
    final name = dir.path.split(RegExp(r'[\\/]')).last;
    test('candidate "$name" is schema-valid and referentially sound', () {
      final data = SeedLoader.parse(
        sourceReferencesJson: readOr('${dir.path}/source_references.json', '[]'),
        pluginsJson: readOr('${dir.path}/plugins.json', '[]'),
        presetsJson: '[]', // presets deferred (content-policy §3)
        workflowRecipesJson: '[]',
        soundDesignNotesJson: readOr('${dir.path}/sound_design_notes.json', '[]'),
      );
      final errors = SeedValidator().validate(data);
      expect(errors, isEmpty, reason: errors.join('\n'));
      for (final note in data.soundDesignNotes) {
        expect(note.sources, isNotEmpty, reason: '${note.id} has no source');
      }
    });
  }

  test('no id collisions across candidates and the shipped seed', () {
    final pluginIds = <String>[];
    final sourceIds = <String>[];

    // Shipped pilot.
    pluginIds.addAll(ids(File('assets/seed/plugins.json').readAsStringSync()));
    sourceIds
        .addAll(ids(File('assets/seed/source_references.json').readAsStringSync()));

    // Staged candidates.
    for (final dir in candidates()) {
      pluginIds.addAll(ids(readOr('${dir.path}/plugins.json', '[]')));
      sourceIds.addAll(ids(readOr('${dir.path}/source_references.json', '[]')));
    }

    expect(pluginIds.toSet().length, pluginIds.length,
        reason: 'duplicate plugin id across seed + staging');
    expect(sourceIds.toSet().length, sourceIds.length,
        reason: 'duplicate source id across seed + staging');
  });
}
