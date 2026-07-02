import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/tier_badge.dart';
import '../../saved/application/saved_providers.dart';
import '../application/vault_providers.dart';

/// Plugin detail — identity, metadata, presets, notes, and the evidence trail.
class PluginDetailScreen extends ConsumerWidget {
  const PluginDetailScreen({super.key, required this.pluginId});

  final String pluginId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(pluginDetailProvider(pluginId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin'),
        actions: [_SaveAction(pluginId: pluginId)],
      ),
      body: SafeArea(
        child: AsyncValueView<PluginDetail>(
          value: detail,
          loadingLabel: 'Loading plugin…',
          onRetry: () => ref.invalidate(pluginDetailProvider(pluginId)),
          data: (d) => _Body(detail: d),
        ),
      ),
    );
  }
}

/// Bookmark toggle for saving this plugin (User Saved Item). Saved state is
/// shown by icon SHAPE (filled vs outline) plus colour — never colour alone.
class _SaveAction extends ConsumerWidget {
  const _SaveAction({required this.pluginId});
  final String pluginId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.tonaryColors;
    final saved = ref.watch(isPluginSavedProvider(pluginId)).value ?? false;
    return IconButton(
      icon: Icon(saved ? Icons.bookmark : Icons.bookmark_border),
      color: saved ? c.accentPrimary : c.textSecondary,
      tooltip: saved ? 'Saved' : 'Save',
      onPressed: () =>
          ref.read(savedItemsControllerProvider).togglePlugin(pluginId),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.detail});
  final PluginDetail detail;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final p = detail.plugin;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(TonarySpacing.lg),
      children: [
        Text(p.name, style: text.displaySmall),
        const SizedBox(height: TonarySpacing.sm),
        Wrap(
          spacing: TonarySpacing.sm,
          runSpacing: TonarySpacing.sm,
          children: [
            TierBadge(p.tier),
            TonaryBadge(p.type.wire, tone: BadgeTone.info),
            TonaryBadge(p.vendorName ?? p.vendor),
          ],
        ),
        const SizedBox(height: TonarySpacing.lg),
        Text(
          p.description,
          style: text.bodyMedium?.copyWith(color: c.textSecondary),
        ),

        _Section(
          title: 'Category',
          child: Text(p.category, style: text.bodyMedium),
        ),
        if (p.tags.isNotEmpty)
          _Section(
            title: 'Tags',
            child: _Chips(labels: p.tags),
          ),
        if (p.capabilities.isNotEmpty)
          _Section(
            title: 'Capabilities',
            child: _Chips(labels: p.capabilities, tone: BadgeTone.creative),
          ),
        if (detail.presets.isNotEmpty)
          _Section(
            title: 'Presets (${detail.presets.length})',
            child: Column(
              children: [
                for (final preset in detail.presets)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(preset.name, style: text.labelLarge),
                    subtitle: Text(
                      preset.category,
                      style: text.bodySmall?.copyWith(color: c.textSecondary),
                    ),
                  ),
              ],
            ),
          ),
        if (detail.notes.isNotEmpty)
          _Section(
            title: 'Notes (${detail.notes.length})',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final note in detail.notes) ...[
                  Row(
                    children: [
                      Expanded(child: Text(note.topic, style: text.labelLarge)),
                      // evidenceLevel as icon+label (never color alone).
                      TonaryBadge(
                        note.evidenceLevel.wire,
                        tone: BadgeTone.info,
                      ),
                    ],
                  ),
                  const SizedBox(height: TonarySpacing.xs),
                  Text(
                    note.body,
                    style: text.bodySmall?.copyWith(color: c.textSecondary),
                  ),
                  const SizedBox(height: TonarySpacing.md),
                ],
              ],
            ),
          ),
        _Section(
          title: 'Sources (${detail.sources.length})',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final s in detail.sources)
                Padding(
                  padding: const EdgeInsets.only(bottom: TonarySpacing.sm),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.link, size: 16, color: c.accentInfo),
                      const SizedBox(width: TonarySpacing.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.title, style: text.bodySmall),
                            Text(
                              '${s.sourceType.wire} · ${s.reliability.wire}',
                              style: text.labelSmall?.copyWith(
                                color: c.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.only(top: TonarySpacing.xl2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: c.textMuted,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: TonarySpacing.sm),
          child,
        ],
      ),
    );
  }
}

class _Chips extends StatelessWidget {
  const _Chips({required this.labels, this.tone = BadgeTone.neutral});
  final List<String> labels;
  final BadgeTone tone;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: TonarySpacing.sm,
      runSpacing: TonarySpacing.sm,
      children: [for (final l in labels) TonaryBadge(l, tone: tone)],
    );
  }
}
