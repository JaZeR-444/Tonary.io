import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../design_system/colors/tonary_colors.dart';
import '../../../design_system/spacing/tonary_spacing.dart';
import '../../../shared/models/models.dart';
import '../../vault/application/vault_providers.dart';

/// Home / launchpad — the branded entry surface into the shipped modules, with
/// a live (offline) count of the indexed dataset. Mobile-first: calm, stacked,
/// thumb-reachable cards (`.claude/rules/mobile-first-rules.md`).
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final c = context.tonaryColors;
    final plugins = ref.watch(vaultPluginsProvider);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(TonarySpacing.lg),
          children: [
            const SizedBox(height: TonarySpacing.md),
            // Display face (Space Grotesk) is reserved for the hero H1.
            Text('Tonary', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: TonarySpacing.sm),
            Text(
              'Your dark-first sound-design intelligence layer.',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: c.textSecondary),
            ),
            const SizedBox(height: TonarySpacing.md),
            _DatasetStat(plugins: plugins),
            const SizedBox(height: TonarySpacing.xl2),
            Text('MODULES',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: c.textSecondary, letterSpacing: 0.8)),
            const SizedBox(height: TonarySpacing.sm),
            _ModuleCard(
              icon: Icons.inventory_2_outlined,
              title: 'Vault',
              subtitle: 'Browse curated plugin, preset & chain records.',
              onTap: () => context.go('/vault'),
            ),
            _ModuleCard(
              icon: Icons.travel_explore_outlined,
              title: 'Scout',
              subtitle: 'Match plugins to what you’re going for.',
              onTap: () => context.go('/scout'),
            ),
            _ModuleCard(
              icon: Icons.compare_arrows,
              title: 'Briefs',
              subtitle: 'Compare two plugins, side by side.',
              onTap: () => context.go('/briefs'),
            ),
            _ModuleCard(
              icon: Icons.search,
              title: 'Search',
              subtitle: 'Find a plugin by name, tag, tier or type.',
              onTap: () => context.push('/search'),
            ),
            _ModuleCard(
              icon: Icons.bookmark_border,
              title: 'Saved',
              subtitle: 'Your favorited plugins, in one place.',
              onTap: () => context.push('/saved'),
            ),
          ],
        ),
      ),
    );
  }
}

/// A calm, offline microcopy line reflecting the seeded dataset. Never blocks
/// the screen: it degrades to a neutral label while loading or on error.
class _DatasetStat extends StatelessWidget {
  const _DatasetStat({required this.plugins});
  final AsyncValue<List<Plugin>> plugins;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final label = plugins.when(
      data: (list) => '${list.length} plugin${list.length == 1 ? '' : 's'} indexed · offline',
      loading: () => 'Indexing…',
      error: (_, _) => 'Offline dataset',
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.offline_bolt_outlined, size: 14, color: c.accentInfo),
        const SizedBox(width: TonarySpacing.xs),
        Text(label,
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: c.textMuted)),
      ],
    );
  }
}

/// A full-width, thumb-friendly module entry.
class _ModuleCard extends StatelessWidget {
  const _ModuleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    return Padding(
      padding: const EdgeInsets.only(bottom: TonarySpacing.sm),
      child: Semantics(
        button: true,
        label: '$title. $subtitle',
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            constraints: const BoxConstraints(
                minHeight: TonarySpacing.minTapTarget * 1.2),
            padding: const EdgeInsets.all(TonarySpacing.lg),
            decoration: BoxDecoration(
              color: c.surfaceCard,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: c.outlineControl),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(TonarySpacing.sm),
                  decoration: BoxDecoration(
                    color: c.surfaceRaised,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: c.outlineControl),
                  ),
                  child: Icon(icon, size: 20, color: c.textPrimary),
                ),
                const SizedBox(width: TonarySpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: TonarySpacing.xs),
                      Text(subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: c.textSecondary)),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, size: 20, color: c.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
