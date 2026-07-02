// Validates the staged Harmor migration candidate against the real schema
// validator — before it is ever promoted into the shipped seed. This is the
// automatable part of OQ-12 gate #4 (schema validity + referential integrity);
// the legal-content review and human sign-off are tracked in STAGING-README.md.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/sources/seed/seed_loader.dart';
import 'package:tonary/data/sources/seed/seed_validator.dart';

void main() {
  const dir = '.claude/outputs/migration-staging/harmor';
  String read(String name) => File('$dir/$name').readAsStringSync();

  test('Harmor candidate is schema-valid and referentially sound', () {
    final data = SeedLoader.parse(
      sourceReferencesJson: read('source_references.json'),
      pluginsJson: read('plugins.json'),
      presetsJson: '[]', // presets deferred (content-policy gate #4)
      workflowRecipesJson: '[]',
      soundDesignNotesJson: read('sound_design_notes.json'),
    );

    final errors = SeedValidator().validate(data);
    expect(errors, isEmpty, reason: errors.join('\n'));

    // Sanity: the record and its evidence are present.
    expect(data.plugins.single.id, 'harmor');
    expect(data.plugins.single.sources, isNotEmpty);
    expect(data.soundDesignNotes, isNotEmpty);
    for (final note in data.soundDesignNotes) {
      expect(note.sources, isNotEmpty, reason: '${note.id} has no source');
    }
  });
}
