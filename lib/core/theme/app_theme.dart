import 'package:flutter/material.dart';
import 'package:news_c16_sun/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24 , fontWeight: FontWeight.bold , color: AppColors.black
      )
    )
  );
}
