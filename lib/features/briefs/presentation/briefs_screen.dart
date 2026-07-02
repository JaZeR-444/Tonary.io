import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/tier_badge.dart';
import '../application/briefs_providers.dart';
import '../application/plugin_comparison.dart';

/// Tonary Briefs — fast, offline, side-by-side comparison of two Vault plugins
/// with evidence-backed explanations and next-step recipes. Curated/static, no
/// AI (`.claude/project/mvp-scope.md`). All facts trace to sourced records.
class BriefsScreen extends ConsumerWidget {
  const BriefsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plugins = ref.watch(briefsPluginsProvider);
    final selection = ref.watch(briefsSelectionProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Briefs')),
      body: SafeArea(
        child: AsyncValueView<List<Plugin>>(
          value: plugins,
          loadingLabel: 'Indexing plugins…',
          isEmpty: (list) => list.length < 2,
          emptyTitle: 'Not enough to compare',
          emptyMessage: 'At least two plugins must be seeded to build a Brief.',
          onRetry: () => ref.invalidate(briefsPluginsProvider),
          data: (list) => ListView(
            padding: const EdgeInsets.all(TonarySpacing.lg),
            children: [
              _SelectorRow(plugins: list, selection: selection),
              const SizedBox(height: TonarySpacing.xl),
              if (selection.isComplete)
                _ComparisonResult(aId: selection.aId!, bId: selection.bId!)
              else
                const _PromptState(),
            ],
          ),
        ),
      ),
    );
  }
}

/// The two picker slots (A vs B) with a swap control between them.
class _SelectorRow extends ConsumerWidget {
  const _SelectorRow({required this.plugins, required this.selection});

  final List<Plugin> plugins;
  final BriefsSelection selection;

  Plugin? _byId(String? id) {
    if (id == null) return null;
    for (final p in plugins) {
      if (p.id == id) return p;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(briefsSelectionProvider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _SlotCard(
            label: 'Plugin A',
            plugin: _byId(selection.aId),
            onTap: () async {
              final id = await _pickPlugin(
                context,
                plugins,
                excludeId: selection.bId,
              );
              if (id != null) notifier.selectA(id);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TonarySpacing.sm),
          child: IconButton(
            icon: const Icon(Icons.swap_horiz),
            tooltip: 'Swap A and B',
            onPressed: selection.isComplete ? notifier.swap : null,
          ),
        ),
        Expanded(
          child: _SlotCard(
            label: 'Plugin B',
            plugin: _byId(selection.bId),
            onTap: () async {
              final id = await _pickPlugin(
                context,
                plugins,
                excludeId: selection.aId,
              );
              if (id != null) notifier.selectB(id);
            },
          ),
        ),
      ],
    );
  }
}

/// A single picker slot — shows the chosen plugin or a "Choose" affordance.
class _SlotCard extends StatelessWidget {
  const _SlotCard({
    required this.label,
    required this.plugin,
    required this.onTap,
  });

  final String label;
  final Plugin? plugin;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Semantics(
      button: true,
      label: plugin == null
          ? '$label, choose a plugin'
          : '$label, ${plugin!.name}',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: TonarySpacing.minTapTarget * 1.4,
          ),
          padding: const EdgeInsets.all(TonarySpacing.md),
          decoration: BoxDecoration(
            color: c.surfaceCard,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: c.outlineControl),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label.toUpperCase(),
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: c.textSecondary),
              ),
              const SizedBox(height: TonarySpacing.xs),
              Text(
                plugin?.name ?? 'Choose plugin',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: plugin == null ? c.textMuted : c.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Opens a bottom-sheet plugin picker; resolves to the chosen id or null.
Future<String?> _pickPlugin(
  BuildContext context,
  List<Plugin> plugins, {
  String? excludeId,
}) {
  final options = plugins.where((p) => p.id != excludeId).toList();
  return showModalBottomSheet<String>(
    context: context,
    showDragHandle: true,
    builder: (context) => SafeArea(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: options.length,
        itemBuilder: (context, i) {
          final p = options[i];
          return ListTile(
            title: Text(p.name),
            subtitle: Text(p.category),
            trailing: TierBadge(p.tier),
            onTap: () => Navigator.of(context).pop(p.id),
          );
        },
      ),
    ),
  );
}

/// Loads and renders the assembled comparison once both slots are chosen.
class _ComparisonResult extends ConsumerWidget {
  const _ComparisonResult({required this.aId, required this.bId});

  final String aId;
  final String bId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(comparisonProvider((aId, bId)));
    return AsyncValueView<ComparisonData>(
      value: data,
      loadingLabel: 'Building the Brief…',
      onRetry: () => ref.invalidate(comparisonProvider((aId, bId))),
      data: (d) {
        final cmp = d.comparison;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ComparisonTable(comparison: cmp),
            if (cmp.sharedCapabilities.isNotEmpty ||
                cmp.sharedTags.isNotEmpty) ...[
              const SizedBox(height: TonarySpacing.xl),
              _SharedSection(
                capabilities: cmp.sharedCapabilities,
                tags: cmp.sharedTags,
              ),
            ],
            const SizedBox(height: TonarySpacing.xl),
            _WhySection(
              plugin: cmp.pluginA,
              notes: d.notesA,
              sources: d.sourcesA,
            ),
            const SizedBox(height: TonarySpacing.lg),
            _WhySection(
              plugin: cmp.pluginB,
              notes: d.notesB,
              sources: d.sourcesB,
            ),
            if (d.relatedRecipes.isNotEmpty) ...[
              const SizedBox(height: TonarySpacing.xl),
              _NextSteps(recipes: d.relatedRecipes),
            ],
          ],
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: TonarySpacing.sm),
    child: Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: context.tonaryColors.textSecondary,
        letterSpacing: 0.8,
      ),
    ),
  );
}

class _ComparisonTable extends StatelessWidget {
  const _ComparisonTable({required this.comparison});
  final PluginComparison comparison;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final headStyle = Theme.of(
      context,
    ).textTheme.labelLarge?.copyWith(color: c.textPrimary);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Expanded(flex: 3, child: SizedBox()),
            Expanded(
              flex: 4,
              child: Text(comparison.pluginA.name, style: headStyle),
            ),
            Expanded(
              flex: 4,
              child: Text(comparison.pluginB.name, style: headStyle),
            ),
          ],
        ),
        const SizedBox(height: TonarySpacing.sm),
        for (final row in comparison.rows) _TableRow(row: row),
      ],
    );
  }
}

class _TableRow extends StatelessWidget {
  const _TableRow({required this.row});
  final ComparisonRow row;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    // Differing rows: emphasise both values (weight) AND carry an explicit
    // "differs" icon+label — never signalled by colour alone (ui-ux-rules).
    final valueStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: row.differs ? c.textPrimary : c.textSecondary,
      fontWeight: row.differs ? FontWeight.w600 : FontWeight.w400,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TonarySpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    row.label,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: c.textMuted),
                  ),
                ),
                if (row.differs)
                  Padding(
                    padding: const EdgeInsets.only(left: TonarySpacing.xs),
                    child: Semantics(
                      label: 'differs',
                      child: Icon(
                        Icons.change_history,
                        size: 12,
                        color: c.accentInfo,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(flex: 4, child: Text(row.valueA, style: valueStyle)),
          Expanded(flex: 4, child: Text(row.valueB, style: valueStyle)),
        ],
      ),
    );
  }
}

class _SharedSection extends StatelessWidget {
  const _SharedSection({required this.capabilities, required this.tags});
  final List<String> capabilities;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader('In common'),
        Wrap(
          spacing: TonarySpacing.sm,
          runSpacing: TonarySpacing.sm,
          children: [
            for (final cap in capabilities)
              TonaryBadge(cap, tone: BadgeTone.success),
            for (final tag in tags) TonaryBadge(tag, tone: BadgeTone.neutral),
          ],
        ),
      ],
    );
  }
}

/// The evidence-backed "why" for one plugin: its description, sound-design
/// notes, and the Source References those facts trace to.
class _WhySection extends StatelessWidget {
  const _WhySection({
    required this.plugin,
    required this.notes,
    required this.sources,
  });

  final Plugin plugin;
  final List<SoundDesignNote> notes;
  final List<SourceReference> sources;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Container(
      padding: const EdgeInsets.all(TonarySpacing.lg),
      decoration: BoxDecoration(
        color: c.surfaceCard,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: c.outlineControl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader('Why ${plugin.name}'),
          Text(
            plugin.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          for (final note in notes) ...[
            const SizedBox(height: TonarySpacing.md),
            Text(
              note.topic,
              style: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: c.textPrimary),
            ),
            const SizedBox(height: TonarySpacing.xs),
            Text(
              note.body,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: c.textSecondary),
            ),
          ],
          if (sources.isNotEmpty) ...[
            const SizedBox(height: TonarySpacing.md),
            Wrap(
              spacing: TonarySpacing.sm,
              runSpacing: TonarySpacing.xs,
              children: [
                for (final s in sources)
                  TonaryBadge(s.title, tone: BadgeTone.info),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Next-step recipes that use either plugin (read-only in MVP — the Flow module
/// is deferred, so recipes are shown but not yet openable).
class _NextSteps extends StatelessWidget {
  const _NextSteps({required this.recipes});
  final List<WorkflowRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionHeader('Next steps'),
        for (final r in recipes)
          Padding(
            padding: const EdgeInsets.only(bottom: TonarySpacing.sm),
            child: Container(
              padding: const EdgeInsets.all(TonarySpacing.md),
              decoration: BoxDecoration(
                color: c.surfaceCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: c.outlineControl),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          r.title,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      TonaryBadge(r.difficulty.wire, tone: BadgeTone.creative),
                    ],
                  ),
                  const SizedBox(height: TonarySpacing.xs),
                  Text(
                    r.goal,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: c.textSecondary),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Shown before both slots are chosen — invites the comparison.
class _PromptState extends StatelessWidget {
  const _PromptState();

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.only(top: TonarySpacing.xl3),
      child: Column(
        children: [
          Icon(Icons.compare_arrows, size: 40, color: c.textMuted),
          const SizedBox(height: TonarySpacing.md),
          Text(
            'Compare two plugins',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: TonarySpacing.sm),
          Text(
            'Pick a plugin for each slot to see a side-by-side Brief — '
            'what differs, what they share, and where to go next.',
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: c.textSecondary),
          ),
        ],
      ),
    );
  }
}
