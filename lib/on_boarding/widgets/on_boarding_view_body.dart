import 'package:fahimak_ai/theme/app_text_styles.dart';
import 'package:fahimak_ai/widgets/custom_animated.dart';
import 'package:fahimak_ai/widgets/primary_button.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.white),
      child: Stack(
        // alignment: AlignmentDirectional.center,
        children: [
          PageView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAnimated(
                      isFromUp: true,
                      child: Image.asset(AppImages.onBoarding1),
                    ),
                    Text(
                      "مرحبا بك في تطبيق فاهمك❤️",
                      style: AppTextStyles.headingH3.copyWith(
                        color: AppColors.primary,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "تطبيقك الذكي لفهمك ومساعدتك بأفضل شكل ممكن. دعنا نبدأ!",
                      style: AppTextStyles.body16.copyWith(
                        color: AppColors.primary,
                      ),
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              Container(color: Colors.green),
            ],
          ),
          Positioned(
            bottom: 40,
            left: 12,
            right: 12,
            child: CustomAnimated(
              isFromUp: false,
              child: PrimaryButton(text: 'التالي', onParsed: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
