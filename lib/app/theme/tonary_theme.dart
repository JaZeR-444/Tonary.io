import 'package:flutter/material.dart';

import '../../design_system/colors/tonary_colors.dart';
import '../../design_system/typography/tonary_typography.dart';

/// Assembles the Tonary [ThemeData] from the design-system tokens.
/// Dark-first: this is the only theme at launch (light theme not required — see
/// `.claude/project/product-foundation.md`).
abstract final class TonaryTheme {
  static ThemeData dark() {
    const c = TonaryColors.dark;

    final colorScheme = const ColorScheme.dark().copyWith(
      surface: c.bgApp,
      onSurface: c.textPrimary,
      primary: c.accentPrimary,
      onPrimary: c.textPrimary, // light label on royal-violet primary
      secondary: c.accentInfo,
      onSecondary: c.textPrimary,
      error: c.accentDanger,
      onError: c.bgApp,
      outline: c.outlineControl,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: c.bgApp,
      colorScheme: colorScheme,
      fontFamily: TonaryTypography.fontUi,
      textTheme: TonaryTypography.textTheme(c.textPrimary),
      extensions: const <ThemeExtension<dynamic>>[c],
      appBarTheme: AppBarTheme(
        backgroundColor: c.bgShell,
        foregroundColor: c.textPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: c.bgShell,
        indicatorColor: c.brandSoft,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => TextStyle(
            fontFamily: TonaryTypography.fontUi,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: states.contains(WidgetState.selected)
                ? c.accentPrimary
                : c.textSecondary,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? c.accentPrimary
                : c.textSecondary,
          ),
        ),
      ),
      dividerColor: c.borderSubtle,
    );
  }
}
