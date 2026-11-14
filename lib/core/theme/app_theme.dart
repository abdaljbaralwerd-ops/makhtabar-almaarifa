import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const seed = Color(0xFF176B5B);
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
      scaffoldBackgroundColor: const Color(0xFFF6F8F7),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Color(0xFFF6F8F7),
        foregroundColor: Color(0xFF173D36),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFFE5ECE9)),
        ),
      ),
    );
  }
}
