import 'package:flutter/material.dart';

class AppTheme {
  // Dracula Dark colors
  static const _darkBackground = Color(0xFF282A36);
  static const _darkSurface = Color(0xFF44475A);
  static const _darkForeground = Color(0xFFF8F8F2);
  static const _darkPrimary = Color(0xFFBD93F9);
  static const _darkSecondary = Color(0xFFFF79C6);
  static const _darkButton = Color(0xFF383A4A);

  // Dracula Light colors
  static const _lightBackground = Color(0xFFF8F8F2);
  static const _lightSurface = Color(0xFFE9E9F4);
  static const _lightForeground = Color(0xFF282A36);
  static const _lightPrimary = Color(0xFF7B5EA7);
  static const _lightSecondary = Color(0xFFC4417A);
  static const _lightButton = Color(0xFFD8D8F0);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        surface: _darkSurface,
        primary: _darkPrimary,
        secondary: _darkSecondary,
        onSurface: _darkForeground,
        onPrimary: _darkBackground,
        onSecondary: _darkBackground,
        surfaceContainer: _darkButton,
        error: Color(0xFFFF5555),
        onError: _darkBackground,
      ),
      scaffoldBackgroundColor: _darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkForeground,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _darkButton,
          foregroundColor: _darkForeground,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: _darkForeground),
        bodyLarge: TextStyle(color: _darkForeground),
        titleLarge: TextStyle(color: _darkForeground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF5555)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF5555), width: 2),
        ),
        filled: true,
        fillColor: _darkButton,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: _darkSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        surface: _lightSurface,
        primary: _lightPrimary,
        secondary: _lightSecondary,
        onSurface: _lightForeground,
        onPrimary: _lightBackground,
        onSecondary: _lightBackground,
        surfaceContainer: _lightButton,
        error: Color(0xFFFF5555),
        onError: _lightBackground,
      ),
      scaffoldBackgroundColor: _lightBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: _lightSurface,
        foregroundColor: _lightForeground,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _lightButton,
          foregroundColor: _lightForeground,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: _lightForeground),
        bodyLarge: TextStyle(color: _lightForeground),
        titleLarge: TextStyle(color: _lightForeground),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF5555)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFFF5555), width: 2),
        ),
        filled: true,
        fillColor: _lightButton,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: _lightSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
