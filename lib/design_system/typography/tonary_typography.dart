import 'package:flutter/material.dart';

/// Tonary type system, anchored at 16px on a rounded major-third scale
/// (Tonary Brand Kit). Faces:
///   UI      = Inter        (default — body, labels, nav, tables)
///   display = Space Grotesk (H1–H3 / hero ONLY)
///   mono    = IBM Plex Mono (ids, params, token references)
///
/// The font families below are bundled offline as OFL assets (see
/// `pubspec.yaml` `fonts:` and `assets/fonts/`). Inter and Space Grotesk are
/// variable fonts (Flutter maps `fontWeight` to the wght axis); IBM Plex Mono
/// ships as static weights.
abstract final class TonaryTypography {
  static const String fontUi = 'Inter';
  static const String fontDisplay = 'Space Grotesk';
  static const String fontMono = 'IBM Plex Mono';

  /// Builds the Tonary [TextTheme] over a base (color applied by the theme).
  static TextTheme textTheme(Color onSurface) {
    TextStyle ui(
      double size,
      double height,
      FontWeight weight, {
      double spacing = 0,
    }) => TextStyle(
      fontFamily: fontUi,
      fontSize: size,
      height: height,
      fontWeight: weight,
      letterSpacing: spacing,
      color: onSurface,
    );

    TextStyle display(
      double size,
      double height, {
      double spacing = 0,
      FontWeight weight = FontWeight.w700,
    }) => TextStyle(
      fontFamily: fontDisplay,
      fontSize: size,
      height: height,
      fontWeight: weight,
      letterSpacing: spacing,
      color: onSurface,
    );

    return TextTheme(
      // Display face — H1–H3 / hero only.
      displayLarge: display(45, 1.10, spacing: -0.9), // type-display-xl (H1)
      displayMedium: display(36, 1.17, spacing: -0.54), // type-heading-xl (H2)
      displaySmall: display(30, 1.20, spacing: -0.3), // type-heading-lg (H3)
      // UI face — everything else.
      headlineSmall: ui(
        24,
        1.25,
        FontWeight.w600,
        spacing: -0.24,
      ), // heading-md
      titleLarge: ui(18, 1.55, FontWeight.w600), // lead
      bodyLarge: ui(18, 1.55, FontWeight.w400), // body-lg
      bodyMedium: ui(16, 1.50, FontWeight.w400), // body-md (default)
      bodySmall: ui(14, 1.43, FontWeight.w400), // body-sm
      labelLarge: ui(16, 1.25, FontWeight.w600), // button-md (>=14/600 rule)
      labelMedium: ui(14, 1.20, FontWeight.w600, spacing: 0.07), // button-sm
      labelSmall: ui(12, 1.33, FontWeight.w500, spacing: 0.12), // caption
    );
  }
}
