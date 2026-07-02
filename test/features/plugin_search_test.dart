// Unit tests for the pure PluginSearch matcher — no Flutter, no DB. Covers
// term matching across fields, AND semantics, ranking, and the empty query.

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/features/search/application/plugin_search.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

Plugin _plugin(
  String id,
  String name, {
  String category = 'Synth',
  String vendor = 'Image-Line',
  PluginType type = PluginType.generator,
  PluginTier tier = PluginTier.free,
  List<String> tags = const [],
  List<String> capabilities = const [],
}) =>
    Plugin(
      id: id,
      name: name,
      vendor: vendor,
      category: category,
      type: type,
      tier: tier,
      description: 'A $name plugin.',
      tags: tags,
      capabilities: capabilities,
      sources: const ['src-x'],
    );

void main() {
  final flex = _plugin('flex', 'FLEX',
      category: 'Synth', tags: const ['rompler', 'preset']);
  final eq2 = _plugin('fruity-parametric-eq-2', 'Fruity Parametric EQ 2',
      category: 'EQ', type: PluginType.effect, tier: PluginTier.premium,
      tags: const ['mixing', 'clarity']);
  final sytrus = _plugin('sytrus', 'Sytrus',
      category: 'Synth', tags: const ['fm', 'bass']);
  final all = [flex, eq2, sytrus];

  group('PluginSearch.run', () {
    test('empty or whitespace query returns nothing (prompt state)', () {
      expect(PluginSearch.run(all, ''), isEmpty);
      expect(PluginSearch.run(all, '   '), isEmpty);
    });

    test('matches by name (case-insensitive, partial)', () {
      final r = PluginSearch.run(all, 'sytr');
      expect(r.map((p) => p.id), ['sytrus']);
    });

    test('matches by category', () {
      final r = PluginSearch.run(all, 'eq');
      expect(r.map((p) => p.id), contains('fruity-parametric-eq-2'));
    });

    test('matches by tag', () {
      final r = PluginSearch.run(all, 'bass');
      expect(r.map((p) => p.id), ['sytrus']);
    });

    test('matches by tier and by type keywords', () {
      expect(PluginSearch.run(all, 'premium').map((p) => p.id),
          ['fruity-parametric-eq-2']);
      expect(PluginSearch.run(all, 'effect').map((p) => p.id),
          ['fruity-parametric-eq-2']);
    });

    test('AND semantics: every term must match', () {
      // "synth" matches flex & sytrus; adding "fm" narrows to sytrus only.
      expect(PluginSearch.run(all, 'synth fm').map((p) => p.id), ['sytrus']);
      // A term that matches nothing excludes the plugin entirely.
      expect(PluginSearch.run(all, 'synth zzz'), isEmpty);
    });

    test('ranks a name-prefix hit above a category/tag hit', () {
      final synthEq = _plugin('eq-synth', 'EQ Synthers', category: 'Synth');
      final r = PluginSearch.run([flex, synthEq], 'eq');
      // "EQ Synthers" starts with "eq" → outranks flex (category "Synth"...
      // which does not even contain "eq"); flex is excluded.
      expect(r.map((p) => p.id), ['eq-synth']);
    });

    test('no match returns empty (no-results state)', () {
      expect(PluginSearch.run(all, 'granular-nonexistent'), isEmpty);
    });
  });
}
