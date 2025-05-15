import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: AlignmentDirectional.center,
      children: [
        PageView(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.onBoarding1),
                    Text(
                      "مرحبا بك في تطبيق فاهمك",
                      // textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(color: Colors.green),
            // Container(color: Colors.blue),
          ],
        ),
        Positioned(
          bottom: 40,
          left: 12,
          right: 12,
          child: MainButton(
            backgroundColor: AppColors.primary,
            text: 'التالي',
            onParsed: () {},
          ),
        ),
      ],
    );
  }
}

class MainButton extends StatelessWidget {
  final VoidCallback onParsed;
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;

  const MainButton({
    super.key,
    required this.onParsed,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Full width
      height: 56,
      child: ElevatedButton(
        onPressed: onParsed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFF7B61FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 12),
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style:
              textStyle ??
              const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
