import 'package:flutter/material.dart';
import 'package:quotes/core/utils/app_colors.dart';
import 'package:quotes/core/utils/app_strings.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.hintColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      brightness: Brightness.light,
      fontFamily: AppStrings.fontFamily,
      textTheme: const TextTheme(
        button: TextStyle(
          fontSize: 16,
          color: AppColors.buttonColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
