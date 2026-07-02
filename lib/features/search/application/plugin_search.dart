import '../../../shared/models/models.dart';

/// Pure, offline search over Vault plugin records. Kept out of the widget layer
/// so the ranking is unit-testable (`.claude/rules/flutter-rules.md` — no
/// business logic in widgets).
///
/// Matches the fields the MVP names — name, tags, category, tier, type — plus
/// vendor and capabilities. Semantics are AND across whitespace-separated terms:
/// every term must match somewhere, so "free eq" narrows rather than widens.
abstract final class PluginSearch {
  /// Field weights — higher means a stronger signal for ranking. A name prefix
  /// beats a name substring, which beats a category/tag hit, and so on.
  static const int _wNamePrefix = 100;
  static const int _wNameContains = 50;
  static const int _wCategory = 20;
  static const int _wTag = 15;
  static const int _wTierType = 10;
  static const int _wVendorCapability = 5;

  /// Returns [all] filtered to plugins matching every term in [query], ranked by
  /// relevance then name. An empty/whitespace query returns an empty list — the
  /// caller shows the prompt state, not "no results".
  static List<Plugin> run(List<Plugin> all, String query) {
    final terms = _tokenize(query);
    if (terms.isEmpty) return const [];

    final scored = <(Plugin, int)>[];
    for (final plugin in all) {
      final score = _score(plugin, terms);
      if (score != null) scored.add((plugin, score));
    }
    scored.sort((a, b) {
      final byScore = b.$2.compareTo(a.$2);
      if (byScore != 0) return byScore;
      return a.$1.name.toLowerCase().compareTo(b.$1.name.toLowerCase());
    });
    return [for (final entry in scored) entry.$1];
  }

  static List<String> _tokenize(String query) => query
      .toLowerCase()
      .split(RegExp(r'\s+'))
      .where((t) => t.isNotEmpty)
      .toList();

  /// Total score for [plugin] if it matches ALL [terms], else null (excluded).
  static int? _score(Plugin plugin, List<String> terms) {
    var total = 0;
    for (final term in terms) {
      final best = _bestFieldScore(plugin, term);
      if (best == 0) return null; // this term matched nothing → exclude plugin
      total += best;
    }
    return total;
  }

  /// The strongest field weight at which [term] matches [plugin], or 0.
  static int _bestFieldScore(Plugin plugin, String term) {
    final name = plugin.name.toLowerCase();
    if (name.startsWith(term)) return _wNamePrefix;
    if (name.contains(term)) return _wNameContains;
    if (plugin.category.toLowerCase().contains(term)) return _wCategory;
    if (plugin.tags.any((t) => t.toLowerCase().contains(term))) return _wTag;
    if (plugin.tier.wire.toLowerCase().contains(term) ||
        plugin.type.wire.toLowerCase().contains(term)) {
      return _wTierType;
    }
    if (plugin.vendor.toLowerCase().contains(term) ||
        (plugin.vendorName?.toLowerCase().contains(term) ?? false) ||
        plugin.capabilities.any((c) => c.toLowerCase().contains(term))) {
      return _wVendorCapability;
    }
    return 0;
  }
}
