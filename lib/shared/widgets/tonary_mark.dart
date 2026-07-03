import 'package:flutter/material.dart';

/// The Tonary brand mark (the neural-circuit motif), rendered from the bundled
/// asset. A single source for in-app branding touches — the Home header, the
/// onboarding hero, and Settings ▸ About — so the mark is never re-derived
/// inline. Pair it with the Space Grotesk wordmark rather than baking text into
/// a raster (`.claude/rules/brand-rules.md`).
class TonaryMark extends StatelessWidget {
  const TonaryMark({super.key, this.size = 40});

  /// Rendered width/height in logical pixels. The mark is square.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/branding/exports/icon-512.png',
      width: size,
      height: size,
      filterQuality: FilterQuality.medium,
      semanticLabel: 'Tonary',
    );
  }
}
