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
      cardColor: AppColors.primaryCard,
      scaffoldBackgroundColor: AppColors.primaryBackgrond,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryBackgrondAppBar,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        titleTextStyle: AppTextStyles.headingH2.copyWith(
          color: Colors.black,
          fontFamily: AppFonts.tajawal,
          height: 2,
        ),
        actionsIconTheme: IconThemeData(color: Colors.black),

        centerTitle: true,
      ),
      primaryTextTheme: TextTheme(
        bodySmall: AppTextStyles.body10.copyWith(color: Colors.black),
        labelSmall: AppTextStyles.body12.copyWith(color: Colors.black),
        labelMedium: AppTextStyles.body14.copyWith(color: Colors.black),
        labelLarge: AppTextStyles.body16.copyWith(color: Colors.black),
      ),
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.body16.copyWith(color: AppColors.primaryText),
        bodyMedium: AppTextStyles.body14.copyWith(color: AppColors.primaryText),
        headlineSmall: AppTextStyles.headingH3.copyWith(
          color: AppColors.primaryText,
        ),
        headlineMedium: AppTextStyles.headingH2.copyWith(color: Colors.black),
        headlineLarge: AppTextStyles.headingH1.copyWith(
          color: AppColors.primaryText,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.body14.copyWith(
          color: AppColors.primaryHintText,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }

  // dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppFonts.tajawal,
      primaryColor: AppColors.darkPrimary,
      cardColor: AppColors.darkCard,
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBackgrondAppBar,
        scrolledUnderElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        titleTextStyle: AppTextStyles.headingH2.copyWith(
          color: AppColors.darkTextPrimary,
          fontFamily: AppFonts.tajawal,
          height: 2,
        ),
        actionsIconTheme: IconThemeData(color: AppColors.darkTextPrimary),
        centerTitle: true,
      ),
      primaryTextTheme: TextTheme(
        bodySmall: AppTextStyles.body10.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        labelSmall: AppTextStyles.body12.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        labelMedium: AppTextStyles.body14.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        labelLarge: AppTextStyles.body16.copyWith(
          color: AppColors.darkTextPrimary,
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: AppTextStyles.body16.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        bodyMedium: AppTextStyles.body14.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineSmall: AppTextStyles.headingH3.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineMedium: AppTextStyles.headingH2.copyWith(
          color: AppColors.darkTextPrimary,
        ),
        headlineLarge: AppTextStyles.headingH1.copyWith(
          color: AppColors.darkTextPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.body14.copyWith(color: AppColors.darkHintText),
        fillColor: AppColors.darkBackgrondAppBar,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
      ),
    );
  }
}
