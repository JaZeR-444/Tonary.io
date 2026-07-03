import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/providers.dart';
import '../../../core/errors/failure.dart';
import '../../../shared/models/models.dart';

/// All workflow recipes (Tonary Flow), offline from the seeded DB, sorted by title.
final flowRecipesProvider = FutureProvider<List<WorkflowRecipe>>((ref) async {
  final recipes = await ref.watch(vaultRepositoryProvider).listRecipes();
  return [...recipes]
    ..sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
});

/// Everything a recipe detail renders: the recipe, its plugin-chain records
/// resolved to names (missing ones skipped, never fabricated), and its sources.
class FlowRecipeDetail {
  const FlowRecipeDetail({
    required this.recipe,
    required this.chainPlugins,
    required this.sources,
  });

  final WorkflowRecipe recipe;
  final List<Plugin> chainPlugins;
  final List<SourceReference> sources;
}

final flowRecipeDetailProvider =
    FutureProvider.autoDispose.family<FlowRecipeDetail, String>((ref, id) async {
  final repo = ref.watch(vaultRepositoryProvider);
  final recipes = await repo.listRecipes();
  final recipe = recipes.firstWhere(
    (r) => r.id == id,
    orElse: () => throw NotFoundFailure('Recipe "$id" not found.'),
  );

  final plugins = <Plugin>[];
  for (final pid in recipe.pluginChain) {
    try {
      plugins.add(await repo.pluginById(pid));
    } on NotFoundFailure {
      // Chain references a plugin not present — skip, don't invent.
    }
  }
  final sources = <SourceReference>[
    for (final sid in recipe.sources) await repo.sourceById(sid),
  ];

  return FlowRecipeDetail(
    recipe: recipe,
    chainPlugins: plugins,
    sources: sources,
  );
});
