import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/sources/seed/seed_loader.dart';
import 'package:tonary/data/sources/seed/seed_validator.dart';

/// Guards the *shipped* seed dataset: parses the real `assets/seed/*.json`
/// files and asserts they pass validation. If someone edits the seed into an
/// invalid state, this fails before it can reach a device.
void main() {
  String read(String name) =>
      File('assets/seed/$name').readAsStringSync();

  test('bundled seed parses and passes validation', () {
    final data = SeedLoader.parse(
      sourceReferencesJson: read('source_references.json'),
      pluginsJson: read('plugins.json'),
      presetsJson: read('presets.json'),
      workflowRecipesJson: read('workflow_recipes.json'),
      soundDesignNotesJson: read('sound_design_notes.json'),
    );

    // Sanity on the sample vertical.
    expect(data.plugins, isNotEmpty);
    expect(data.sourceReferences, isNotEmpty);
    expect(data.plugins.map((p) => p.id), contains('flex'));

    final errors = SeedValidator().validate(data);
    expect(errors, isEmpty, reason: errors.join('\n'));
  });
}
