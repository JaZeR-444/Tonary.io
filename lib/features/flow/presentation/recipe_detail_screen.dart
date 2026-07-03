import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../application/flow_providers.dart';

/// Recipe detail — goal, plugin chain, ordered steps, and the evidence trail.
class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({super.key, required this.recipeId});
  final String recipeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(flowRecipeDetailProvider(recipeId));
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe')),
      body: SafeArea(
        child: AsyncValueView<FlowRecipeDetail>(
          value: detail,
          loadingLabel: 'Loading recipe…',
          onRetry: () => ref.invalidate(flowRecipeDetailProvider(recipeId)),
          data: (d) => _Body(detail: d),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.detail});
  final FlowRecipeDetail detail;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final text = Theme.of(context).textTheme;
    final r = detail.recipe;

    return ListView(
      padding: const EdgeInsets.all(TonarySpacing.lg),
      children: [
        Text(r.title, style: text.headlineSmall),
        const SizedBox(height: TonarySpacing.sm),
        Wrap(
          spacing: TonarySpacing.sm,
          runSpacing: TonarySpacing.sm,
          children: [
            TonaryBadge(r.difficulty.wire, tone: BadgeTone.creative),
            TonaryBadge(r.timeEstimate.replaceAll('PT', '').toLowerCase(),
                tone: BadgeTone.info),
            for (final g in r.genreTags) TonaryBadge(g),
          ],
        ),
        const SizedBox(height: TonarySpacing.lg),
        Text(r.goal, style: text.bodyMedium?.copyWith(color: c.textSecondary)),

        _Section(
          title: 'Plugin chain',
          child: Wrap(
            spacing: TonarySpacing.sm,
            runSpacing: TonarySpacing.sm,
            children: [
              for (final p in detail.chainPlugins)
                ActionChip(
                  label: Text(p.name),
                  onPressed: () => context.push('/plugin/${p.id}'),
                ),
            ],
          ),
        ),

        _Section(
          title: 'Steps',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final step in r.steps) ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StepNumber(step.order),
                    const SizedBox(width: TonarySpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(step.action, style: text.bodyMedium),
                          if (step.tip != null) ...[
                            const SizedBox(height: TonarySpacing.xs),
                            Text('Tip: ${step.tip}',
                                style: text.bodySmall
                                    ?.copyWith(color: c.textMuted)),
                          ],
                        ],
                      ),
                    ),
                  ],
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
                  padding: const EdgeInsets.only(bottom: TonarySpacing.xs),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.link, size: 16, color: c.accentInfo),
                      const SizedBox(width: TonarySpacing.sm),
                      Expanded(child: Text(s.title, style: text.bodySmall)),
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

class _StepNumber extends StatelessWidget {
  const _StepNumber(this.n);
  final int n;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: c.surfaceRaised,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: c.outlineControl),
      ),
      child: Text('$n',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: c.textPrimary)),
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
          Text(title.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: c.textMuted, letterSpacing: 0.8)),
          const SizedBox(height: TonarySpacing.sm),
          child,
        ],
      ),
    );
  }
}
