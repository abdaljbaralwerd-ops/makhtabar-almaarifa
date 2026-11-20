import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF075B50);
  static const Color secondary = Color(0xFFD6A84B);
  static const Color background = Color(0xFFF5F7F4);
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF183B35);

  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: primary,
      secondary: secondary,
      surface: surface,
      onPrimary: Colors.white,
      onSecondary: textDark,
      onSurface: textDark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      fontFamily: 'Cairo',
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: background,
        foregroundColor: primary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
