import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF090A10);
  static const surface = Color(0xFF141620);
  static const surface2 = Color(0xFF1B1E2B);
  static const purple = Color(0xFF9A70FF);
  static const purpleLight = Color(0xFFC4AEFF);
  static const textMuted = Color(0xFF9699AE);
  static const boardLight = Color(0xFFD9DCE8);
  static const boardDark = Color(0xFF6D668D);
}

class AppTheme {
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.dark(primary: AppColors.purple, secondary: AppColors.purpleLight, surface: AppColors.surface),
    appBarTheme: const AppBarTheme(backgroundColor: AppColors.background, foregroundColor: Colors.white, elevation: 0),
    inputDecorationTheme: InputDecorationTheme(
      filled: true, fillColor: AppColors.surface2,
      hintStyle: const TextStyle(color: AppColors.textMuted),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFF303344))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFF303344))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: AppColors.purple, width: 1.4)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.purple, foregroundColor: Colors.white, minimumSize: const Size(0, 52),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
    )),
    dividerColor: const Color(0xFF292C3B),
  );
}
