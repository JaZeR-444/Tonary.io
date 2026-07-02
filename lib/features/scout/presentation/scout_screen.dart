import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../application/scout_matcher.dart';
import '../application/scout_providers.dart';

/// Tonary Scout — transparent, offline rule/tag recommendations over Vault
/// records. The producer picks intent facets; Scout ranks plugins and shows
/// exactly why each matched (`.claude/architecture/ai-assistant-architecture.md`).
/// No AI ranking in the MVP — deterministic retrieval only.
class ScoutScreen extends ConsumerWidget {
  const ScoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plugins = ref.watch(scoutPluginsProvider);
    final selected = ref.watch(scoutSelectionProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scout'),
        actions: [
          if (selected.isNotEmpty)
            TextButton(
              onPressed: () =>
                  ref.read(scoutSelectionProvider.notifier).clear(),
              child: const Text('Clear'),
            ),
        ],
      ),
      body: SafeArea(
        child: AsyncValueView<List<Plugin>>(
          value: plugins,
          loadingLabel: 'Indexing plugins…',
          isEmpty: (list) => list.isEmpty,
          emptyTitle: 'Nothing to match yet',
          emptyMessage: 'The curated dataset has not been seeded.',
          onRetry: () => ref.invalidate(scoutPluginsProvider),
          data: (_) => ListView(
            padding: const EdgeInsets.all(TonarySpacing.lg),
            children: [
              Text(
                'What are you going for?',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: TonarySpacing.xs),
              Text(
                'Pick intent facets — Scout ranks plugins and shows why each fits.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: context.tonaryColors.textSecondary,
                ),
              ),
              const SizedBox(height: TonarySpacing.lg),
              const _FacetPicker(),
              const SizedBox(height: TonarySpacing.xl),
              if (selected.isEmpty) const _PromptState() else const _Results(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Grouped, selectable intent facets derived from the seed data.
class _FacetPicker extends ConsumerWidget {
  const _FacetPicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final facets = ref.watch(scoutFacetsProvider);
    final selected = ref.watch(scoutSelectionProvider);
    final notifier = ref.read(scoutSelectionProvider.notifier);

    return facets.maybeWhen(
      orElse: () => const SizedBox.shrink(),
      data: (all) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final kind in ScoutFacetKind.values)
            _FacetGroup(
              kind: kind,
              facets: all.where((f) => f.kind == kind).toList(),
              selected: selected,
              onToggle: notifier.toggle,
            ),
        ],
      ),
    );
  }
}

class _FacetGroup extends StatelessWidget {
  const _FacetGroup({
    required this.kind,
    required this.facets,
    required this.selected,
    required this.onToggle,
  });

  final ScoutFacetKind kind;
  final List<ScoutFacet> facets;
  final Set<ScoutFacet> selected;
  final void Function(ScoutFacet) onToggle;

  @override
  Widget build(BuildContext context) {
    if (facets.isEmpty) return const SizedBox.shrink();
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: TonarySpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kind.label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: c.textSecondary,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: TonarySpacing.sm),
          Wrap(
            spacing: TonarySpacing.sm,
            runSpacing: TonarySpacing.sm,
            children: [
              for (final facet in facets)
                FilterChip(
                  label: Text(facet.value),
                  selected: selected.contains(facet),
                  onSelected: (_) => onToggle(facet),
                  // Checkmark gives a non-colour selection cue (ui-ux-rules).
                  showCheckmark: true,
                  side: BorderSide(color: c.outlineControl),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Ranked recommendations for the current selection.
class _Results extends ConsumerWidget {
  const _Results();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(scoutResultsProvider);
    return AsyncValueView<List<ScoutMatch>>(
      value: results,
      loadingLabel: 'Matching…',
      isEmpty: (list) => list.isEmpty,
      emptyTitle: 'No matches yet',
      emptyMessage:
          'No plugin matches those facets. Try fewer or broader criteria.',
      data: (matches) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${matches.length} match${matches.length == 1 ? '' : 'es'}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: context.tonaryColors.textSecondary,
            ),
          ),
          const SizedBox(height: TonarySpacing.sm),
          for (final match in matches) _MatchTile(match: match),
        ],
      ),
    );
  }
}

class _MatchTile extends StatelessWidget {
  const _MatchTile({required this.match});
  final ScoutMatch match;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final plugin = match.plugin;
    final sourceCount = plugin.sources.length;
    return Padding(
      padding: const EdgeInsets.only(bottom: TonarySpacing.sm),
      child: InkWell(
        onTap: () => context.push('/plugin/${plugin.id}'),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(TonarySpacing.lg),
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
                      plugin.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TonaryBadge(plugin.category, tone: BadgeTone.neutral),
                ],
              ),
              const SizedBox(height: TonarySpacing.sm),
              // Transparent "why": the exact facets this plugin matched.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: TonarySpacing.xs),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 14,
                      color: c.accentSuccess,
                    ),
                  ),
                  const SizedBox(width: TonarySpacing.xs),
                  Expanded(
                    child: Wrap(
                      spacing: TonarySpacing.xs,
                      runSpacing: TonarySpacing.xs,
                      children: [
                        for (final facet in match.matched)
                          TonaryBadge(facet.value, tone: BadgeTone.info),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TonarySpacing.sm),
              Text(
                '$sourceCount Source Reference${sourceCount == 1 ? '' : 's'}',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: c.textMuted),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shown before any facet is chosen.
class _PromptState extends StatelessWidget {
  const _PromptState();

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.only(top: TonarySpacing.xl2),
      child: Column(
        children: [
          Icon(Icons.travel_explore, size: 40, color: c.textMuted),
          const SizedBox(height: TonarySpacing.md),
          Text(
            'Pick what you’re going for',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: TonarySpacing.sm),
          Text(
            'Select one or more facets above to see ranked plugin matches.',
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
