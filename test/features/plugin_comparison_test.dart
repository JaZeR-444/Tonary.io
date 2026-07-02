// Unit tests for the pure PluginComparison builder — no Flutter, no DB. Covers
// row values, the differs flag, and case-insensitive shared capability/tag sets.

import 'package:flutter_test/flutter_test.dart';
import 'package:tonary/features/briefs/application/plugin_comparison.dart';
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
  group('PluginComparison.build', () {
    test('produces the four factual rows with values copied verbatim', () {
      final a = _plugin('flex', 'FLEX');
      final b = _plugin('sytrus', 'Sytrus',
          tier: PluginTier.premium, category: 'FM Synth');
      final cmp = PluginComparison.build(a, b);

      expect(cmp.rows.map((r) => r.label),
          ['Type', 'Tier', 'Category', 'Vendor']);
      final tier = cmp.rows.firstWhere((r) => r.label == 'Tier');
      expect(tier.valueA, 'Free');
      expect(tier.valueB, 'Premium');
    });

    test('flags differing rows and matching rows correctly', () {
      final a = _plugin('flex', 'FLEX', tier: PluginTier.free);
      final b = _plugin('sytrus', 'Sytrus', tier: PluginTier.premium);
      final cmp = PluginComparison.build(a, b);

      // Same type & category & vendor → not differing; tier differs.
      expect(cmp.rows.firstWhere((r) => r.label == 'Type').differs, isFalse);
      expect(cmp.rows.firstWhere((r) => r.label == 'Tier').differs, isTrue);
      expect(cmp.rows.firstWhere((r) => r.label == 'Category').differs, isFalse);
    });

    test('shared capabilities/tags are the case-insensitive intersection', () {
      final a = _plugin('a', 'A',
          capabilities: const ['Presets', 'Modulation'],
          tags: const ['bass', 'lead']);
      final b = _plugin('b', 'B',
          capabilities: const ['presets', 'fx'], tags: const ['LEAD']);
      final cmp = PluginComparison.build(a, b);

      // "Presets" matches "presets" case-insensitively; keeps A's casing.
      expect(cmp.sharedCapabilities, ['Presets']);
      expect(cmp.sharedTags, ['lead']);
    });

    test('empty capability/tag lists yield empty shared sets', () {
      final cmp = PluginComparison.build(_plugin('a', 'A'), _plugin('b', 'B'));
      expect(cmp.sharedCapabilities, isEmpty);
      expect(cmp.sharedTags, isEmpty);
    });

    test('prefers vendorName over vendor when present', () {
      final a = Plugin(
        id: 'a',
        name: 'A',
        vendor: 'il',
        vendorName: 'Image-Line',
        category: 'Synth',
        type: PluginType.generator,
        tier: PluginTier.free,
        description: 'x',
        tags: const [],
        capabilities: const [],
        sources: const ['s'],
      );
      final b = _plugin('b', 'B', vendor: 'Image-Line');
      final cmp = PluginComparison.build(a, b);
      final vendor = cmp.rows.firstWhere((r) => r.label == 'Vendor');
      expect(vendor.valueA, 'Image-Line');
      expect(vendor.differs, isFalse);
    });
  });
}
