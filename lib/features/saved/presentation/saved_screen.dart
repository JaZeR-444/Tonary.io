import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/plugin_list_tile.dart';
import '../application/saved_providers.dart';

/// Saved — the producer's favorited plugins (User Saved Items), offline.
/// Reached from Home; items are saved via the bookmark on a plugin detail.
class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saved = ref.watch(savedPluginsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Saved')),
      body: SafeArea(
        child: AsyncValueView<List<Plugin>>(
          value: saved,
          loadingLabel: 'Loading saved…',
          isEmpty: (list) => list.isEmpty,
          emptyTitle: 'No saved items yet',
          emptyMessage: 'Tap the bookmark on any plugin to save it here.',
          onRetry: () => ref.invalidate(savedPluginsProvider),
          data: (list) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: TonarySpacing.sm),
            itemCount: list.length,
            separatorBuilder: (_, _) =>
                Divider(height: 1, color: context.tonaryColors.borderSubtle),
            itemBuilder: (context, i) => PluginListTile(
              plugin: list[i],
              onTap: () => context.push('/plugin/${list[i].id}'),
            ),
          ),
        ),
      ),
    );
  }
}
