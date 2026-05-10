import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFC6FF00);

  static const Color darkColor = Color(0xFF00233F);

  static const Color lightBlueColor = Color(0xFF3F7495);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: primaryColor,

    colorScheme: ColorScheme.light(
      primary: darkColor,
      secondary: darkColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: darkColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: darkColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: darkColor,
        fontSize: 32,
        fontWeight: .w800,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(.infinity, 60),
        shape: RoundedRectangleBorder(borderRadius: .circular(32)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: .w700),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      contentPadding: const .symmetric(horizontal: 24, vertical: 20),

      hintStyle: TextStyle(color: darkColor, fontSize: 16),
    ),

    cardTheme: CardThemeData(
      color: darkColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: .circular(32)),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: .w800,
        color: darkColor,
      ),
      bodyLarge: TextStyle(fontSize: 18, color: darkColor),
      bodyMedium: TextStyle(fontSize: 16, color: darkColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: darkColor,

    colorScheme: .dark(
      primary: Colors.white,
      secondary: Colors.white,
      surface: Colors.white,
      onPrimary: darkColor,
      onSurface: darkColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: darkColor,
      foregroundColor: primaryColor,

      elevation: 0,
      scrolledUnderElevation: 0,

      surfaceTintColor: Colors.transparent,

      centerTitle: false,

      titleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: 32,
        fontWeight: FontWeight.w800,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: darkColor,

        minimumSize: const Size(double.infinity, 60),

        shape: RoundedRectangleBorder(borderRadius: .circular(32)),

        textStyle: const TextStyle(
          fontSize: 18,
          color: darkColor,
          fontWeight: .w700,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightBlueColor,
      prefixIconColor: Colors.white,

      border: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(32),
        borderSide: .none,
      ),

      contentPadding: const .symmetric(horizontal: 24, vertical: 20),

      hintStyle: TextStyle(color: Colors.white, fontSize: 16),
    ),

    cardTheme: CardThemeData(
      color: lightBlueColor,
      elevation: 0,

      shape: RoundedRectangleBorder(borderRadius: .circular(32)),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: .w800,
        color: primaryColor,
      ),

      bodyLarge: TextStyle(fontSize: 18, color: Colors.white),

      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
