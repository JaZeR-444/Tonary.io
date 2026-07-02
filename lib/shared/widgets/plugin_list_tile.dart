import 'package:flutter/material.dart';

import '../../design_system/colors/tonary_colors.dart';
import '../../design_system/spacing/tonary_spacing.dart';
import '../models/models.dart';
import 'tier_badge.dart';

/// A full-width plugin row (name · category · tier badge) shared by any list of
/// plugins — Vault and Search read from the same tile so a row looks and behaves
/// identically wherever it appears. Navigation is the caller's concern via
/// [onTap] (`.claude/rules/mobile-first-rules.md` — full-width tap target).
class PluginListTile extends StatelessWidget {
  const PluginListTile({super.key, required this.plugin, required this.onTap});

  final Plugin plugin;
  final VoidCallback onTap;

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
      trailing: TierBadge(plugin.tier),
      onTap: onTap,
    );
  }
}
