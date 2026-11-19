import 'package:flutter/material.dart';

class AppThemes {
  static const Color primary = Color(0xFF2563EB);
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primaryText = Color(0xFF1E293B);
  static const Color secondaryText = Color(0xFF64748B);
  static const Color border = Color(0xFFE2E8F0);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);

  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 24.0;
  static const double spaceSection = 32.0;

  static const double radiusCard = 12.0;
  static const double radiusTextField = 10.0;
  static const double radiusButton = 10.0;
  static const double radiusBadge = 20.0;
  static const double radiusImage = 12.0;
  static const double radiusDialog = 16.0;

  static const TextStyle appTitleStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: primaryText,
  );

  static const TextStyle pageHeadingStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: primaryText,
  );

  static const TextStyle sectionHeadingStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryText,
  );

  static const TextStyle cardTitleStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: primaryText,
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: primaryText,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondaryText,
  );

  static const TextStyle statusLabelStyle = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: surface,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'Roboto',
    primaryColor: primary,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: surface,
      secondary: primaryDark,
      onSecondary: surface,
      surface: surface,
      onSurface: primaryText,
      error: error,
      onError: surface,
      outline: border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: surface,
      foregroundColor: primaryText,
      elevation: 0,
      scrolledUnderElevation: 1,
      centerTitle: false,
      titleTextStyle: appTitleStyle,
      iconTheme: IconThemeData(color: primaryText),
      shape: Border(bottom: BorderSide(color: border, width: 1)),
    ),

    textTheme: const TextTheme(
      headlineMedium: pageHeadingStyle,
      titleMedium: sectionHeadingStyle,
      titleSmall: cardTitleStyle,
      bodyMedium: bodyTextStyle,
      bodySmall: secondaryTextStyle,
      labelSmall: statusLabelStyle,
    ),

    cardTheme: CardThemeData(
      color: surface,
      elevation: 1,
      shadowColor: primaryText.withValues(alpha: 0.06),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusCard),
        side: const BorderSide(color: border, width: 1),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      hintStyle: secondaryTextStyle,
      prefixIconColor: secondaryText,
      suffixIconColor: secondaryText,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spaceL,
        vertical: spaceM,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusTextField),
        borderSide: const BorderSide(color: border, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusTextField),
        borderSide: const BorderSide(color: border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusTextField),
        borderSide: const BorderSide(color: primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusTextField),
        borderSide: const BorderSide(color: error, width: 1),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: surface,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: spaceL,
          vertical: spaceM,
        ),
        textStyle: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusButton),
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusDialog),
      ),
      titleTextStyle: sectionHeadingStyle,
      contentTextStyle: bodyTextStyle,
    ),

    dividerTheme: const DividerThemeData(
      color: border,
      thickness: 1,
      space: spaceXL,
    ),
  );
}
