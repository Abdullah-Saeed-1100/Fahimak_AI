import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_text_styles.dart';

class AppTheme {
  const AppTheme._();

  // light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: AppFonts.tajawal,
      primaryColor: AppColors.primary,
      primaryTextTheme: TextTheme(),
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.body16,
        bodyMedium: AppTextStyles.body14,
        headlineSmall: AppTextStyles.headingH3,
        headlineMedium: AppTextStyles.headingH2,
        headlineLarge: AppTextStyles.headingH1,
      ),
    );
  }

  // dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppFonts.tajawal,
      primaryColor: AppColors.primary,
      primaryTextTheme: TextTheme(),
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.body16,
        bodyMedium: AppTextStyles.body14,
        headlineSmall: AppTextStyles.headingH3,
        headlineMedium: AppTextStyles.headingH2,
        headlineLarge: AppTextStyles.headingH1,
      ),
    );
  }
}
