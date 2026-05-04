import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primaryColorLight,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColorLight),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.white),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(color: AppColors.black, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColorLight,
        foregroundColor: AppColors.primaryColorLight,
        elevation: 0,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.darkGrey, fontSize: 16),
      filled: true,
      fillColor: AppColors.lightGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1.5),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.black, fontSize: 32),
      headlineMedium: TextStyle(color: AppColors.black, fontSize: 28),
      headlineSmall: TextStyle(color: AppColors.black, fontSize: 24),
      titleLarge: TextStyle(color: AppColors.black, fontSize: 20),
      titleMedium: TextStyle(color: AppColors.black, fontSize: 16),
      titleSmall: TextStyle(color: AppColors.black, fontSize: 14),
      bodyLarge: TextStyle(color: AppColors.black, fontSize: 14),
      bodyMedium: TextStyle(color: AppColors.black, fontSize: 12),
      bodySmall: TextStyle(color: AppColors.black, fontSize: 10),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    // Dark mode theme settings
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black),
    drawerTheme: DrawerThemeData(backgroundColor: AppColors.black),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      elevation: 0,
      titleTextStyle: TextStyle(color: AppColors.white, fontSize: 20),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.primaryColor,
        elevation: 0,
        minimumSize: Size(double.infinity, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.black, fontSize: 16),
      filled: true,
      fillColor: AppColors.darkGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.red, width: 1.5),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.white, fontSize: 32),
      headlineMedium: TextStyle(color: AppColors.white, fontSize: 28),
      headlineSmall: TextStyle(color: AppColors.white, fontSize: 24),
      titleLarge: TextStyle(color: AppColors.white, fontSize: 20),
      titleMedium: TextStyle(color: AppColors.white, fontSize: 16),
      titleSmall: TextStyle(color: AppColors.white, fontSize: 14),
      bodyLarge: TextStyle(color: AppColors.white, fontSize: 14),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 12),
      bodySmall: TextStyle(color: AppColors.white, fontSize: 10),
    ),
  );
}
