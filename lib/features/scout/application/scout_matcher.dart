import '../../../shared/models/models.dart';

/// The kind of intent facet a producer can select in Scout. Each maps to a
/// factual field on a Plugin record — Scout never invents criteria.
enum ScoutFacetKind {
  category('Category'),
  type('Type'),
  tier('Tier'),
  tag('Tag'),
  capability('Capability');

  const ScoutFacetKind(this.label);
  final String label;

  /// Relative weight — the more specific the intent signal, the stronger the
  /// match. Tags/capabilities express "what you're going for" best.
  int get weight => switch (this) {
    ScoutFacetKind.capability => 3,
    ScoutFacetKind.tag => 3,
    ScoutFacetKind.category => 2,
    ScoutFacetKind.type => 1,
    ScoutFacetKind.tier => 1,
  };
}

/// One selectable intent facet, e.g. (tag, "bass") or (tier, "Free"). Value
/// equality so facets work directly in a Set of selections.
class ScoutFacet {
  const ScoutFacet(this.kind, this.value);
  final ScoutFacetKind kind;
  final String value;

  @override
  bool operator ==(Object other) =>
      other is ScoutFacet && other.kind == kind && other.value == value;

  @override
  int get hashCode => Object.hash(kind, value);
}

/// A ranked recommendation: a plugin, the facets it matched (the transparent
/// "why"), and its score. Higher score = stronger match.
class ScoutMatch {
  const ScoutMatch({
    required this.plugin,
    required this.matched,
    required this.score,
  });

  final Plugin plugin;
  final List<ScoutFacet> matched;
  final int score;
}

/// Pure, offline, deterministic rule/tag matching over Vault plugin records —
/// the "basic Scout" of the MVP (no model, no network;
/// `.claude/architecture/ai-assistant-architecture.md`). Ranking is transparent
/// and every value traces to a sourced Plugin record.
abstract final class ScoutMatcher {
  /// The distinct facets available to pick, derived from [plugins] (never a
  /// hard-coded vocabulary). Categories/tags/capabilities are sorted; type and
  /// tier follow their enum order.
  static List<ScoutFacet> facetsFor(List<Plugin> plugins) {
    final categories = <String>{};
    final tags = <String>{};
    final capabilities = <String>{};
    final types = <String>{};
    final tiers = <String>{};
    for (final p in plugins) {
      categories.add(p.category);
      types.add(p.type.wire);
      tiers.add(p.tier.wire);
      tags.addAll(p.tags);
      capabilities.addAll(p.capabilities);
    }

    List<String> sortedCi(Iterable<String> xs) =>
        xs.toList()..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    return [
      for (final v in sortedCi(categories))
        ScoutFacet(ScoutFacetKind.category, v),
      for (final v in sortedCi(types)) ScoutFacet(ScoutFacetKind.type, v),
      for (final v in sortedCi(tiers)) ScoutFacet(ScoutFacetKind.tier, v),
      for (final v in sortedCi(tags)) ScoutFacet(ScoutFacetKind.tag, v),
      for (final v in sortedCi(capabilities))
        ScoutFacet(ScoutFacetKind.capability, v),
    ];
  }

  /// Ranks [plugins] against the [selected] facets. OR-scoring: a plugin is
  /// included if it matches at least one facet, so Scout always offers the
  /// closest records rather than an empty result. Returns [] when nothing is
  /// selected (caller shows the prompt state). Sorted by score, then name.
  static List<ScoutMatch> recommend(
    List<Plugin> plugins,
    Set<ScoutFacet> selected,
  ) {
    if (selected.isEmpty) return const [];

    final matches = <ScoutMatch>[];
    for (final plugin in plugins) {
      final matched = <ScoutFacet>[];
      var score = 0;
      for (final facet in selected) {
        if (_matches(plugin, facet)) {
          matched.add(facet);
          score += facet.kind.weight;
        }
      }
      if (score > 0) {
        matches.add(ScoutMatch(plugin: plugin, matched: matched, score: score));
      }
    }
    matches.sort((a, b) {
      final byScore = b.score.compareTo(a.score);
      if (byScore != 0) return byScore;
      return a.plugin.name.toLowerCase().compareTo(b.plugin.name.toLowerCase());
    });
    return matches;
  }

  static bool _matches(Plugin plugin, ScoutFacet facet) {
    bool ci(String a, String b) => a.toLowerCase() == b.toLowerCase();
    return switch (facet.kind) {
      ScoutFacetKind.category => ci(plugin.category, facet.value),
      ScoutFacetKind.type => ci(plugin.type.wire, facet.value),
      ScoutFacetKind.tier => ci(plugin.tier.wire, facet.value),
      ScoutFacetKind.tag => plugin.tags.any((t) => ci(t, facet.value)),
      ScoutFacetKind.capability => plugin.capabilities.any(
        (c) => ci(c, facet.value),
      ),
    };
  }
}
