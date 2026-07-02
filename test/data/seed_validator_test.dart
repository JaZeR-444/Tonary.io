import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/data/dto/seed_dtos.dart';
import 'package:tonary/data/sources/seed/seed_validator.dart';

/// A minimal valid dataset used as the baseline; individual tests mutate one
/// thing to prove the corresponding rule fails closed.
SeedData validFixture() => SeedData(
      sourceReferences: [
        SourceReferenceDto(
          id: 'src-flex-manual',
          title: 'FLEX manual',
          sourceType: 'official-manual',
          url: 'https://example.com/flex',
          retrievedAt: '2026-07-02',
          reliability: 'High',
        ),
      ],
      plugins: [
        PluginDto(
          id: 'flex',
          name: 'FLEX',
          vendor: 'Image-Line',
          category: 'Synth',
          type: 'Generator',
          tier: 'Free',
          description: 'A preset synth.',
          tags: const ['synth'],
          capabilities: const ['presets'],
          sources: const ['src-flex-manual'],
        ),
      ],
      presets: [
        PresetDto(
          id: 'flex-pad-01',
          pluginId: 'flex',
          name: 'Pad',
          category: 'Pad',
          useCases: const ['atmosphere'],
          genreTags: const ['cinematic'],
          sources: const ['src-flex-manual'],
        ),
      ],
      workflowRecipes: [
        WorkflowRecipeDto(
          id: 'flex-bass',
          title: 'Bass',
          goal: 'Make a bass.',
          pluginChain: const ['flex'],
          steps: [WorkflowStepDto(order: 1, action: 'Load preset.')],
          difficulty: 'Beginner',
          timeEstimate: 'PT5M',
          genreTags: const ['trap'],
          sources: const ['src-flex-manual'],
        ),
      ],
      soundDesignNotes: [
        SoundDesignNoteDto(
          id: 'flex-note',
          topic: 'Macros',
          subjectRefs: const ['flex'],
          body: 'Macros are fast.',
          evidenceLevel: 'Documented',
          sources: const ['src-flex-manual'],
          createdAt: '2026-07-02',
        ),
      ],
    );

void main() {
  final validator = SeedValidator();

  test('accepts a well-formed dataset', () {
    expect(validator.validate(validFixture()), isEmpty);
  });

  test('rejects a plugin with empty sources[] (evidence required)', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: [
        PluginDto(
          id: 'flex',
          name: 'FLEX',
          vendor: 'Image-Line',
          category: 'Synth',
          type: 'Generator',
          tier: 'Free',
          description: 'x',
          tags: const ['synth'],
          capabilities: const ['presets'],
          sources: const [], // <-- violation
        ),
      ],
      presets: base.presets,
      workflowRecipes: base.workflowRecipes,
      soundDesignNotes: base.soundDesignNotes,
    );
    expect(validator.validate(data), contains(contains('sources[] must be non-empty')));
  });

  test('rejects a non-kebab-case id', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: [
        PluginDto(
          id: 'FLEX_Synth', // <-- violation
          name: 'FLEX',
          vendor: 'Image-Line',
          category: 'Synth',
          type: 'Generator',
          tier: 'Free',
          description: 'x',
          tags: const ['synth'],
          capabilities: const ['presets'],
          sources: const ['src-flex-manual'],
        ),
      ],
      presets: const [],
      workflowRecipes: const [],
      soundDesignNotes: const [],
    );
    expect(validator.validate(data), contains(contains('not kebab-case')));
  });

  test('rejects an unknown enum value (tier)', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: [
        PluginDto(
          id: 'flex',
          name: 'FLEX',
          vendor: 'Image-Line',
          category: 'Synth',
          type: 'Generator',
          tier: 'Gold', // <-- violation
          description: 'x',
          tags: const ['synth'],
          capabilities: const ['presets'],
          sources: const ['src-flex-manual'],
        ),
      ],
      presets: const [],
      workflowRecipes: const [],
      soundDesignNotes: const [],
    );
    expect(validator.validate(data), contains(contains('is not one of')));
  });

  test('rejects an orphan preset (pluginId does not resolve)', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: base.plugins,
      presets: [
        PresetDto(
          id: 'ghost-preset',
          pluginId: 'does-not-exist', // <-- violation
          name: 'Ghost',
          category: 'Pad',
          useCases: const ['x'],
          genreTags: const ['y'],
          sources: const ['src-flex-manual'],
        ),
      ],
      workflowRecipes: const [],
      soundDesignNotes: const [],
    );
    expect(validator.validate(data),
        contains(contains('does not resolve to a Plugin')));
  });

  test('rejects a source[] pointing at a missing Source Reference', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: [
        PluginDto(
          id: 'flex',
          name: 'FLEX',
          vendor: 'Image-Line',
          category: 'Synth',
          type: 'Generator',
          tier: 'Free',
          description: 'x',
          tags: const ['synth'],
          capabilities: const ['presets'],
          sources: const ['src-missing'], // <-- violation
        ),
      ],
      presets: const [],
      workflowRecipes: const [],
      soundDesignNotes: const [],
    );
    expect(validator.validate(data),
        contains(contains('does not resolve to a Source Reference')));
  });

  test('rejects non-contiguous step ordering', () {
    final base = validFixture();
    final data = SeedData(
      sourceReferences: base.sourceReferences,
      plugins: base.plugins,
      presets: const [],
      workflowRecipes: [
        WorkflowRecipeDto(
          id: 'flex-bass',
          title: 'Bass',
          goal: 'x',
          pluginChain: const ['flex'],
          steps: [
            WorkflowStepDto(order: 1, action: 'a'),
            WorkflowStepDto(order: 3, action: 'b'), // <-- gap
          ],
          difficulty: 'Beginner',
          timeEstimate: 'PT5M',
          genreTags: const ['trap'],
          sources: const ['src-flex-manual'],
        ),
      ],
      soundDesignNotes: const [],
    );
    expect(validator.validate(data),
        contains(contains('contiguous 1..N')));
  });
}
