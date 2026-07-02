import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/bootstrap/bootstrap.dart' show kSeedVersion;
import '../../../app/bootstrap/providers.dart';

/// The bundled seed dataset version currently hydrated (real value, single
/// source of truth in bootstrap.dart — never a fabricated number).
final seedVersionProvider = Provider<int>((_) => kSeedVersion);

/// A factual summary of the offline dataset, read from the seeded DB.
class DatasetSummary {
  const DatasetSummary({required this.pluginCount, required this.recipeCount});
  final int pluginCount;
  final int recipeCount;
}

final datasetSummaryProvider = FutureProvider<DatasetSummary>((ref) async {
  final repo = ref.watch(vaultRepositoryProvider);
  final plugins = await repo.listPlugins();
  final recipes = await repo.listRecipes();
  return DatasetSummary(
    pluginCount: plugins.length,
    recipeCount: recipes.length,
  );
});
