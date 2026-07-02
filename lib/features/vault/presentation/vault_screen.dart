import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/components/tonary_badge.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/enums.dart';
import '../../../shared/models/models.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../application/vault_providers.dart';

/// Tonary Vault — list of curated plugin records (list → detail).
class VaultScreen extends ConsumerWidget {
  const VaultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plugins = ref.watch(vaultPluginsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Vault')),
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
            separatorBuilder: (_, _) => Divider(
              height: 1,
              color: context.tonaryColors.borderSubtle,
            ),
            itemBuilder: (context, i) => _PluginTile(plugin: list[i]),
          ),
        ),
      ),
    );
  }
}

class _PluginTile extends StatelessWidget {
  const _PluginTile({required this.plugin});
  final Plugin plugin;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: TonarySpacing.lg,
        vertical: TonarySpacing.xs,
      ),
      title: Text(plugin.name, style: Theme.of(context).textTheme.labelLarge),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: TonarySpacing.xs),
        child: Text(
          plugin.category,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: c.textSecondary),
        ),
      ),
      trailing: TonaryBadge(
        plugin.tier.wire,
        tone: plugin.tier == PluginTier.free
            ? BadgeTone.success
            : BadgeTone.brand,
      ),
      onTap: () => context.push('/vault/${plugin.id}'),
    );
  }
}
