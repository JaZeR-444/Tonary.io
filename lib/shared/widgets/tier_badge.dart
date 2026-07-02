import 'package:flutter/widgets.dart';

import '../../design_system/components/tonary_badge.dart';
import '../models/enums.dart';

/// The tier pill used wherever a plugin's tier is shown. Centralises the color
/// law in one place: Free = affirmative (green), Premium = neutral. Premium is
/// deliberately NOT amber — amber is reserved for brand action only
/// (`.claude/rules/brand-rules.md`). Meaning also carries in the label text.
class TierBadge extends StatelessWidget {
  const TierBadge(this.tier, {super.key});

  final PluginTier tier;

  @override
  Widget build(BuildContext context) => TonaryBadge(
    tier.wire,
    tone: tier == PluginTier.free ? BadgeTone.success : BadgeTone.neutral,
  );
}
