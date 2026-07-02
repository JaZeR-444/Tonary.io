import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/plugin_list_tile.dart';
import '../application/vault_providers.dart';

/// Tonary Vault — list of curated plugin records (list → detail).
class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plugins = ref.watch(vaultPluginsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vault'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search plugins',
            onPressed: () => context.push('/search'),
          ),
        ],
      ),
      body: SafeArea(
        child: AsyncValueView<List<Plugin>>(
          value: plugins,
          loadingLabel: 'Indexing plugins…',
          isEmpty: (list) => list.isEmpty,
          emptyTitle: 'No plugins yet',
          emptyMessage: 'The curated dataset has not been seeded.',
          onRetry: () => ref.invalidate(vaultPluginsProvider),
          data: (list) => ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: TonarySpacing.sm),
            itemCount: list.length,
            separatorBuilder: (_, _) =>
                Divider(height: 1, color: context.tonaryColors.borderSubtle),
            itemBuilder: (context, i) => PluginListTile(
              plugin: list[i],
              onTap: () => context.push('/vault/${list[i].id}'),
            ),
          ),
        ),
      ),
    );
  }
}
