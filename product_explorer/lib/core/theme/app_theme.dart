import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF111111);
  static const Color primaryLight = Color(0xFF2B2B2B);
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF7F7F7);
  static const Color primaryText = Color(0xFF111111);
  static const Color secondaryText = Color(0xFF757575);
  static const Color mutedText = Color(0xFFA3A3A3);
  static const Color border = Color(0xFFE5E5E5);

  static const Color saleAccent = Color(0xFFD0021B);
  static const Color success = Color(0xFF1B7A43);
  static const Color warning = Color(0xFFD97706);

  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 12.0;
  static const double spaceL = 16.0;
  static const double spaceXL = 24.0;
  static const double spaceXXL = 32.0;

  static const double radiusNone = 0.0;
  static const double radiusSubtle = 2.0;
  static const double radiusBadge = 0.0;

  static const TextStyle brandLogoStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    letterSpacing: 3.0,
    color: primaryText,
  );

  static const TextStyle pageHeadingStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: primaryText,
  );

  static const TextStyle sectionHeadingStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: primaryText,
  );

  static const TextStyle productTitleStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.35,
    color: primaryText,
  );

  static const TextStyle priceStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.2,
    color: primaryText,
  );

  static const TextStyle salePriceStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: saleAccent,
  );

  static const TextStyle strikePriceStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.lineThrough,
    color: mutedText,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: secondaryText,
  );

  static const TextStyle badgeLabelStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.0,
    color: background,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: background,
      secondary: primaryLight,
      onSecondary: background,
      surface: background,
      onSurface: primaryText,
      error: saleAccent,
      onError: background,
      outline: border,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: primaryText,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: brandLogoStyle,
      iconTheme: IconThemeData(color: primaryText, size: 22),
      shape: Border(bottom: BorderSide(color: border, width: 1)),
    ),

    textTheme: const TextTheme(
      headlineMedium: pageHeadingStyle,
      titleMedium: sectionHeadingStyle,
      titleSmall: productTitleStyle,
      bodyMedium: productTitleStyle,
      bodySmall: secondaryTextStyle,
      labelSmall: badgeLabelStyle,
    ),

    cardTheme: CardThemeData(
      color: background,
      elevation: 0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSubtle),
        side: const BorderSide(color: border, width: 1),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      hintStyle: secondaryTextStyle,
      prefixIconColor: secondaryText,
      suffixIconColor: primaryText,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: spaceL,
        vertical: spaceM,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSubtle),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSubtle),
        borderSide: const BorderSide(color: border, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusSubtle),
        borderSide: const BorderSide(color: primary, width: 1.2),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: background,
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        padding: const EdgeInsets.symmetric(
          horizontal: spaceXL,
          vertical: spaceM,
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSubtle),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        backgroundColor: background,
        minimumSize: const Size(double.infinity, 48),
        side: const BorderSide(color: primary, width: 1),
        padding: const EdgeInsets.symmetric(
          horizontal: spaceXL,
          vertical: spaceM,
        ),
        textStyle: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSubtle),
        ),
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: background,
      selectedColor: primary,
      disabledColor: surface,
      labelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: primaryText,
      ),
      secondaryLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
        color: background,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: spaceM,
        vertical: spaceXS,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusSubtle),
        side: const BorderSide(color: border, width: 1),
      ),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: background,
      selectedItemColor: primary,
      unselectedItemColor: secondaryText,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.8,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.8,
      ),
    ),

    dividerTheme: const DividerThemeData(
      color: border,
      thickness: 1,
      space: spaceXL,
    ),
  );
}
