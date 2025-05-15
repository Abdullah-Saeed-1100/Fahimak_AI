import 'package:fahimak_ai/features/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:fahimak_ai/core/utils/app_colors.dart';
import 'package:fahimak_ai/core/utils/app_fonts.dart';
import 'package:fahimak_ai/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FahimakAi());
}

class FahimakAi extends StatelessWidget {
  const FahimakAi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fahimak AI -- dev.Abdullah Saeed Bagar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: AppFonts.tajawal,
        primaryTextTheme: TextTheme(),
        textTheme: TextTheme(
          bodyLarge: AppTextStyles.body16,
          bodyMedium: AppTextStyles.body14,
          headlineSmall: AppTextStyles.headingH3,
          headlineMedium: AppTextStyles.headingH2,
          headlineLarge: AppTextStyles.headingH1,
        ),
      ),
      home: const OnBoardingViewBody(),
    );
  }
}
