import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../application/flow_providers.dart';

/// Tonary Flow — workflow recipes (setup paths / sound-design playbooks),
/// offline. List → detail; reached from Home.
class FlowScreen extends ConsumerWidget {
  const FlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(flowRecipesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Flow')),
      body: SafeArea(
        child: AsyncValueView<List<WorkflowRecipe>>(
          value: recipes,
          loadingLabel: 'Loading recipes…',
          isEmpty: (list) => list.isEmpty,
          emptyTitle: 'No recipes yet',
          emptyMessage: 'Workflow recipes will appear here.',
          onRetry: () => ref.invalidate(flowRecipesProvider),
          data: (list) => ListView.separated(
            padding: const EdgeInsets.all(TonarySpacing.lg),
            itemCount: list.length,
            separatorBuilder: (_, _) => const SizedBox(height: TonarySpacing.sm),
            itemBuilder: (context, i) => _RecipeCard(recipe: list[i]),
          ),
        ),
      ),
    );
  }
}

class _RecipeCard extends StatelessWidget {
  const _RecipeCard({required this.recipe});
  final WorkflowRecipe recipe;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return InkWell(
      onTap: () => context.push('/recipe/${recipe.id}'),
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
                  child: Text(recipe.title,
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                TonaryBadge(recipe.difficulty.wire, tone: BadgeTone.creative),
              ],
            ),
            const SizedBox(height: TonarySpacing.xs),
            Text(recipe.goal,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: c.textSecondary)),
            const SizedBox(height: TonarySpacing.sm),
            Text(
              '${recipe.pluginChain.length} plugins · ${recipe.timeEstimate.replaceAll('PT', '').toLowerCase()}',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: c.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
