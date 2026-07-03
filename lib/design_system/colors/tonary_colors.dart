import 'package:flutter/material.dart';

/// Tonary semantic color tokens (dark-first), sourced verbatim from the
/// Tonary Brand Kit. See `.claude/brand/brand-rules.md` for the color law.
///
/// Color law (Obsidian Orchid — icon-anchored, violet-first; enforced in review):
///   violet   = brand action ONLY (primary) — never general decoration
///   lavender = focus / system + creative accent
///   green    = success ONLY
///   amber    = warning ONLY
///   rose     = error / danger
/// Cyan is a restrained technical support accent only, never brand identity.
///
/// Use semantic Dart names (e.g. [bgApp], [outlineControl]) — never raw hex in
/// widgets, and never the legacy `--citrus-console-*` CSS names.
@immutable
class TonaryColors extends ThemeExtension<TonaryColors> {
  const TonaryColors({
    required this.bgApp,
    required this.bgShell,
    required this.surfaceCard,
    required this.surfaceRaised,
    required this.surfaceHover,
    required this.borderSubtle,
    required this.borderStrong,
    required this.outlineControl,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.accentPrimary,
    required this.accentPrimaryHover,
    required this.accentPrimaryActive,
    required this.accentSuccess,
    required this.accentInfo,
    required this.accentCreative,
    required this.accentWarning,
    required this.accentDanger,
    required this.brandSoft,
    required this.successSoft,
    required this.infoSoft,
    required this.warningSoft,
    required this.dangerSoft,
  });

  // Surfaces (deepest -> highest)
  final Color bgApp;
  final Color bgShell;
  final Color surfaceCard;
  final Color surfaceRaised;
  final Color surfaceHover;

  // Borders / outlines
  final Color borderSubtle;
  final Color borderStrong;

  /// Derived control outline (#5a666c) — the required production token for
  /// control borders, chart axes, and keyboard-visible boundaries.
  final Color outlineControl;

  // Text
  final Color textPrimary;
  final Color textSecondary;

  /// Microcopy / placeholder ONLY — never body text.
  final Color textMuted;

  // Accents (each owns one meaning — see color law above)
  final Color accentPrimary; // royal violet — brand action
  final Color accentPrimaryHover;
  final Color accentPrimaryActive;
  final Color accentSuccess; // green — success only
  final Color accentInfo; // violet — focus/system
  final Color accentCreative; // lavender — creative
  final Color accentWarning; // amber — warning only
  final Color accentDanger; // rose — error/danger

  // Soft semantic surfaces (derived)
  final Color brandSoft;
  final Color successSoft;
  final Color infoSoft;
  final Color warningSoft;
  final Color dangerSoft;

  /// The canonical dark-first palette. This is the single source of truth in code.
  static const TonaryColors dark = TonaryColors(
    bgApp: Color(0xFF08070F),
    bgShell: Color(0xFF0B0916),
    surfaceCard: Color(0xFF100E20),
    surfaceRaised: Color(0xFF17142C),
    surfaceHover: Color(0xFF201B3A),
    borderSubtle: Color(0xFF1B1836),
    borderStrong: Color(0xFF37315A),
    outlineControl: Color(0xFF6B6493),
    textPrimary: Color(0xFFF4F2FB),
    textSecondary: Color(0xFFB8B2D6),
    textMuted: Color(0xFF837DA3),
    accentPrimary: Color(0xFF6B5CD6),
    accentPrimaryHover: Color(0xFF7C6EE2),
    accentPrimaryActive: Color(0xFF5B4DC4),
    accentSuccess: Color(0xFF5FBF8F),
    accentInfo: Color(0xFF8B7BF0),
    accentCreative: Color(0xFFA99EE6),
    accentWarning: Color(0xFFD8AB52),
    accentDanger: Color(0xFFE06A82),
    brandSoft: Color(0xFF1B1740),
    successSoft: Color(0xFF13251E),
    infoSoft: Color(0xFF191534),
    warningSoft: Color(0xFF2A2213),
    dangerSoft: Color(0xFF2A1A22),
  );

  @override
  TonaryColors copyWith({
    Color? bgApp,
    Color? bgShell,
    Color? surfaceCard,
    Color? surfaceRaised,
    Color? surfaceHover,
    Color? borderSubtle,
    Color? borderStrong,
    Color? outlineControl,
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? accentPrimary,
    Color? accentPrimaryHover,
    Color? accentPrimaryActive,
    Color? accentSuccess,
    Color? accentInfo,
    Color? accentCreative,
    Color? accentWarning,
    Color? accentDanger,
    Color? brandSoft,
    Color? successSoft,
    Color? infoSoft,
    Color? warningSoft,
    Color? dangerSoft,
  }) {
    return TonaryColors(
      bgApp: bgApp ?? this.bgApp,
      bgShell: bgShell ?? this.bgShell,
      surfaceCard: surfaceCard ?? this.surfaceCard,
      surfaceRaised: surfaceRaised ?? this.surfaceRaised,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderStrong: borderStrong ?? this.borderStrong,
      outlineControl: outlineControl ?? this.outlineControl,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      accentPrimary: accentPrimary ?? this.accentPrimary,
      accentPrimaryHover: accentPrimaryHover ?? this.accentPrimaryHover,
      accentPrimaryActive: accentPrimaryActive ?? this.accentPrimaryActive,
      accentSuccess: accentSuccess ?? this.accentSuccess,
      accentInfo: accentInfo ?? this.accentInfo,
      accentCreative: accentCreative ?? this.accentCreative,
      accentWarning: accentWarning ?? this.accentWarning,
      accentDanger: accentDanger ?? this.accentDanger,
      brandSoft: brandSoft ?? this.brandSoft,
      successSoft: successSoft ?? this.successSoft,
      infoSoft: infoSoft ?? this.infoSoft,
      warningSoft: warningSoft ?? this.warningSoft,
      dangerSoft: dangerSoft ?? this.dangerSoft,
    );
  }

  @override
  TonaryColors lerp(ThemeExtension<TonaryColors>? other, double t) {
    if (other is! TonaryColors) return this;
    return TonaryColors(
      bgApp: Color.lerp(bgApp, other.bgApp, t)!,
      bgShell: Color.lerp(bgShell, other.bgShell, t)!,
      surfaceCard: Color.lerp(surfaceCard, other.surfaceCard, t)!,
      surfaceRaised: Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      outlineControl: Color.lerp(outlineControl, other.outlineControl, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      accentPrimary: Color.lerp(accentPrimary, other.accentPrimary, t)!,
      accentPrimaryHover: Color.lerp(
        accentPrimaryHover,
        other.accentPrimaryHover,
        t,
      )!,
      accentPrimaryActive: Color.lerp(
        accentPrimaryActive,
        other.accentPrimaryActive,
        t,
      )!,
      accentSuccess: Color.lerp(accentSuccess, other.accentSuccess, t)!,
      accentInfo: Color.lerp(accentInfo, other.accentInfo, t)!,
      accentCreative: Color.lerp(accentCreative, other.accentCreative, t)!,
      accentWarning: Color.lerp(accentWarning, other.accentWarning, t)!,
      accentDanger: Color.lerp(accentDanger, other.accentDanger, t)!,
      brandSoft: Color.lerp(brandSoft, other.brandSoft, t)!,
      successSoft: Color.lerp(successSoft, other.successSoft, t)!,
      infoSoft: Color.lerp(infoSoft, other.infoSoft, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
    );
  }
}

/// Convenience accessor: `context.tonaryColors`.
extension TonaryColorsX on BuildContext {
  TonaryColors get tonaryColors =>
      Theme.of(this).extension<TonaryColors>() ?? TonaryColors.dark;
}
