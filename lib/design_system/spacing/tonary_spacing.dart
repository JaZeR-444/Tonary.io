/// Tonary spacing scale — 4pt base (see `.claude/rules/ui-ux-rules.md`).
/// Use these tokens instead of arbitrary margins/padding.
abstract final class TonarySpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xl2 = 24;
  static const double xl3 = 32;
  static const double xl4 = 40;

  /// Minimum interactive tap target (Material) — mobile-first rule.
  static const double minTapTarget = 48;
}
