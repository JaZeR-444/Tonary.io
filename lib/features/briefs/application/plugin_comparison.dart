import '../../../shared/models/models.dart';

/// One row of a side-by-side comparison: a labelled field with each plugin's
/// value and whether they differ (so the UI can mark the difference without
/// relying on colour alone — `.claude/rules/ui-ux-rules.md`).
class ComparisonRow {
  const ComparisonRow({
    required this.label,
    required this.valueA,
    required this.valueB,
    required this.differs,
  });

  final String label;
  final String valueA;
  final String valueB;
  final bool differs;
}

/// A pure, factual comparison of two plugin records. Every value is copied
/// verbatim from the sourced [Plugin] records — nothing is inferred or
/// synthesised, so a Brief never fabricates (`.claude/rules/data-modeling-rules.md`).
class PluginComparison {
  const PluginComparison({
    required this.pluginA,
    required this.pluginB,
    required this.rows,
    required this.sharedCapabilities,
    required this.sharedTags,
  });

  final Plugin pluginA;
  final Plugin pluginB;
  final List<ComparisonRow> rows;

  /// Capabilities/tags present on BOTH plugins (case-insensitive), preserving
  /// plugin A's original casing.
  final List<String> sharedCapabilities;
  final List<String> sharedTags;

  static PluginComparison build(Plugin a, Plugin b) {
    String vendorLabel(Plugin p) =>
        (p.vendorName != null && p.vendorName!.isNotEmpty)
        ? p.vendorName!
        : p.vendor;

    ComparisonRow row(String label, String va, String vb) =>
        ComparisonRow(label: label, valueA: va, valueB: vb, differs: va != vb);

    final rows = <ComparisonRow>[
      row('Type', a.type.wire, b.type.wire),
      row('Tier', a.tier.wire, b.tier.wire),
      row('Category', a.category, b.category),
      row('Vendor', vendorLabel(a), vendorLabel(b)),
    ];

    return PluginComparison(
      pluginA: a,
      pluginB: b,
      rows: rows,
      sharedCapabilities: _intersect(a.capabilities, b.capabilities),
      sharedTags: _intersect(a.tags, b.tags),
    );
  }

  /// Items in [first] that also appear in [second], compared case-insensitively,
  /// returned in [first]'s order and casing.
  static List<String> _intersect(List<String> first, List<String> second) {
    final lowerSecond = second.map((e) => e.toLowerCase()).toSet();
    return [
      for (final item in first)
        if (lowerSecond.contains(item.toLowerCase())) item,
    ];
  }
}
