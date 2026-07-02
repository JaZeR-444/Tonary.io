import 'package:flutter/material.dart';

import '../colors/tonary_colors.dart';
import '../spacing/tonary_spacing.dart';

/// Semantic tone for a badge. Maps to the color law — never color-alone: a badge
/// always carries a text label (`.claude/brand/brand-rules.md`).
enum BadgeTone { neutral, brand, info, success, creative }

/// A soft-surface pill with accent text. Used for tiers, categories, tags.
class TonaryBadge extends StatelessWidget {
  const TonaryBadge(this.label, {super.key, this.tone = BadgeTone.neutral});

  final String label;
  final BadgeTone tone;

  @override
  Widget build(BuildContext context) {
    final c = context.tonaryColors;
    final (bg, fg) = switch (tone) {
      BadgeTone.neutral => (c.surfaceCard, c.textSecondary),
      BadgeTone.brand => (c.brandSoft, c.accentPrimary),
      BadgeTone.info => (c.infoSoft, c.accentInfo),
      BadgeTone.success => (c.successSoft, c.accentSuccess),
      BadgeTone.creative => (c.brandSoft, c.accentCreative),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TonarySpacing.sm,
        vertical: TonarySpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: c.outlineControl),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
