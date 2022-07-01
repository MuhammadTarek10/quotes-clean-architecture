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
        headline2: TextStyle(
          height: 1.3,
          fontSize: 22,
          color: AppColors.quoteColor,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          height: 1.3,
          fontSize: 18,
          color: AppColors.buttonColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.buttonColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
