import 'package:flutter/material.dart';

/// Tonary semantic color tokens (dark-first), sourced verbatim from the
/// Tonary Brand Kit. See `.claude/brand/brand-rules.md` for the color law.
///
/// Color law (enforced in review):
///   amber  = brand action ONLY (never general decoration)
///   cyan   = focus / system
///   green  = affirmative
///   violet = exploratory / creative
///   red    = exceptional / danger
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
  final Color accentPrimary; // amber — brand action
  final Color accentPrimaryHover;
  final Color accentPrimaryActive;
  final Color accentSuccess; // green
  final Color accentInfo; // cyan — focus/system
  final Color accentCreative; // violet
  final Color accentWarning; // orange
  final Color accentDanger; // red

  // Soft semantic surfaces (derived)
  final Color brandSoft;
  final Color successSoft;
  final Color infoSoft;
  final Color warningSoft;
  final Color dangerSoft;

  /// The canonical dark-first palette. This is the single source of truth in code.
  static const TonaryColors dark = TonaryColors(
    bgApp: Color(0xFF07090A),
    bgShell: Color(0xFF0E1114),
    surfaceCard: Color(0xFF151A1F),
    surfaceRaised: Color(0xFF1D242B),
    surfaceHover: Color(0xFF26313A),
    borderSubtle: Color(0xFF2F3A43),
    borderStrong: Color(0xFF43505A),
    outlineControl: Color(0xFF5A666C),
    textPrimary: Color(0xFFF8FAF2),
    textSecondary: Color(0xFFB8C0B5),
    textMuted: Color(0xFF7E8A82),
    accentPrimary: Color(0xFFFFB13B),
    accentPrimaryHover: Color(0xFFFFC766),
    accentPrimaryActive: Color(0xFFDA9834),
    accentSuccess: Color(0xFF33D17A),
    accentInfo: Color(0xFF38BDF8),
    accentCreative: Color(0xFFA78BFA),
    accentWarning: Color(0xFFF59E0B),
    accentDanger: Color(0xFFF87171),
    brandSoft: Color(0xFF2B2419),
    successSoft: Color(0xFF122820),
    infoSoft: Color(0xFF13262F),
    warningSoft: Color(0xFF2A2213),
    dangerSoft: Color(0xFF2A1D1F),
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
