import 'package:flutter/material.dart';
import 'package:zalada_flutter/shared/colors/app_color.dart';

import '../spacing/app_spacing.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Kantumruy Pro',
    appBarTheme: const AppBarTheme(color: AppColors.kPrimaryColor),
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kBackgroundColor,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.lg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      isDense: true,
    ),
    iconTheme: const IconThemeData(size: AppSpacing.lg),
  );
}
