import 'package:flutter/material.dart';

import 'app_colors.dart';

const double _buttonRadius = 10;

ThemeData buildTheme() {
  const buttonText = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(_buttonRadius),
  );

  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Ubuntu',
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w400
      ),
      bodySmall: TextStyle(
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.w400
      )
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(0, 60),
        textStyle: buttonText,
        shape: buttonShape,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.primary,
        minimumSize: const Size(0, 60),
        textStyle: buttonText,
        side: const BorderSide(color: AppColors.border, width: 2),
        shape: buttonShape,
      ),
    ),
  );
}