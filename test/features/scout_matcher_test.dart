// Unit tests for the pure ScoutMatcher — facet derivation, OR-scoring,
// ranking, and the transparent "why" (matched facets). No Flutter, no DB.

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/features/scout/application/scout_matcher.dart';
import 'package:tonary/shared/models/enums.dart';
import 'package:tonary/shared/models/models.dart';

Plugin _plugin(
  String id,
  String name, {
  String category = 'Synth',
  PluginType type = PluginType.generator,
  PluginTier tier = PluginTier.free,
  List<String> tags = const [],
  List<String> capabilities = const [],
}) => Plugin(
  id: id,
  name: name,
  vendor: 'Image-Line',
  category: category,
  type: type,
  tier: tier,
  description: 'A $name plugin.',
  tags: tags,
  capabilities: capabilities,
  sources: const ['src-x'],
);

void main() {
  final flex = _plugin(
    'flex',
    'FLEX',
    category: 'Synth',
    tags: const ['bass', 'lead'],
    capabilities: const ['presets'],
  );
  final sytrus = _plugin(
    'sytrus',
    'Sytrus',
    category: 'Synth',
    tier: PluginTier.premium,
    tags: const ['bass', 'fm'],
    capabilities: const ['fm', 'presets'],
  );
  final eq2 = _plugin(
    'eq2',
    'Fruity Parametric EQ 2',
    category: 'EQ',
    type: PluginType.effect,
    tier: PluginTier.premium,
    tags: const ['mixing'],
  );
  final all = [flex, sytrus, eq2];

  group('ScoutMatcher.facetsFor', () {
    test('derives distinct facets from the seed (no hard-coded vocab)', () {
      final facets = ScoutMatcher.facetsFor(all);
      bool has(ScoutFacetKind k, String v) => facets.contains(ScoutFacet(k, v));

      expect(has(ScoutFacetKind.category, 'Synth'), isTrue);
      expect(has(ScoutFacetKind.category, 'EQ'), isTrue);
      expect(has(ScoutFacetKind.type, 'Effect'), isTrue);
      expect(has(ScoutFacetKind.tier, 'Premium'), isTrue);
      expect(has(ScoutFacetKind.tag, 'bass'), isTrue);
      expect(has(ScoutFacetKind.capability, 'fm'), isTrue);
      // No duplicate 'bass' facet even though two plugins carry it.
      expect(
        facets
            .where((f) => f.kind == ScoutFacetKind.tag && f.value == 'bass')
            .length,
        1,
      );
    });
  });

  group('ScoutMatcher.recommend', () {
    test('empty selection returns nothing (prompt state)', () {
      expect(ScoutMatcher.recommend(all, const {}), isEmpty);
    });

    test('OR-scoring returns every plugin matching at least one facet', () {
      final r = ScoutMatcher.recommend(all, {
        const ScoutFacet(ScoutFacetKind.tag, 'bass'),
      });
      expect(r.map((m) => m.plugin.id), containsAll(['flex', 'sytrus']));
      expect(r.map((m) => m.plugin.id), isNot(contains('eq2')));
    });

    test('ranks a plugin that matches more/heavier facets higher', () {
      // Both match tag:bass; only sytrus also matches capability:fm (weight 3).
      final r = ScoutMatcher.recommend(all, {
        const ScoutFacet(ScoutFacetKind.tag, 'bass'),
        const ScoutFacet(ScoutFacetKind.capability, 'fm'),
      });
      expect(r.first.plugin.id, 'sytrus');
      expect(r.first.score, greaterThan(r.last.score));
    });

    test('exposes the matched facets as the transparent "why"', () {
      final r = ScoutMatcher.recommend(all, {
        const ScoutFacet(ScoutFacetKind.category, 'Synth'),
      });
      final flexMatch = r.firstWhere((m) => m.plugin.id == 'flex');
      expect(
        flexMatch.matched,
        contains(const ScoutFacet(ScoutFacetKind.category, 'Synth')),
      );
    });

    test('a facet nothing satisfies yields no matches', () {
      final r = ScoutMatcher.recommend(all, {
        const ScoutFacet(ScoutFacetKind.tag, 'granular'),
      });
      expect(r, isEmpty);
    });
  });
}
