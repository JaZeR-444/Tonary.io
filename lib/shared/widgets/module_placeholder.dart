import 'package:flutter/material.dart';

import '../../design_system/colors/tonary_colors.dart';
import '../../design_system/spacing/tonary_spacing.dart';

/// A reusable, on-brand placeholder for scaffolded module screens.
/// Real feature UI replaces these as each module is built
/// (see `.claude/workflows/feature-build-workflow.md`).
class ModulePlaceholder extends StatelessWidget {
  const ModulePlaceholder({
    super.key,
    required this.title,
    required this.tagline,
    required this.icon,
    this.status = 'Scaffold — feature not built yet',
  });

  final String title;
  final String tagline;
  final IconData icon;
  final String status;

  @override
  Widget build(BuildContext context) {
    final colors = context.tonaryColors;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(TonarySpacing.xl2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Stroke-first icon; accent used as a sparing callout, not decoration.
            Icon(icon, size: 48, color: colors.accentPrimary),
            const SizedBox(height: TonarySpacing.lg),
            Text(
              title,
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TonarySpacing.sm),
            Text(
              tagline,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TonarySpacing.xl2),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TonarySpacing.md,
                vertical: TonarySpacing.sm,
              ),
              decoration: BoxDecoration(
                color: colors.surfaceCard,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: colors.outlineControl),
              ),
              child: Text(
                status,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: colors.textMuted),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
