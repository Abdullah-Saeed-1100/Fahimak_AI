import 'package:fahimak_ai/core/widgets/custom_animated.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_images.dart';
import '../../chat_ai/views/chat_ai_view.dart';
import 'on_boarding_content.dart';
import '../../../core/widgets/primary_button.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Helper to get current page safely
  int get _currentPage {
    if (!_pageController.hasClients || _pageController.page == null) return 0;
    return _pageController.page!.round();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        // color: AppColors.primary25,
        gradient: LinearGradient(
          colors: [Colors.white, AppColors.primary25],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (_) => setState(() {}),
            children: const [
              OnBoardingContent(
                image: AppImages.onBoarding1,
                title: 'مرحبا بك في تطبيق "فاهمك"❤️',
                description:
                    "تطبيقك الذكي لفهمك ومساعدتك بأفضل شكل ممكن. فاهمك يقدم لك إجابات دقيقة وسريعة في أي وقت تحتاج فيه للمعلومة. دعنا نبدأ!",
              ),
              OnBoardingContent(
                image: AppImages.onBoarding2,
                title: "🤖 مساعدك الذكي دائماً معك",
                description:
                    'الآن يمكنك تخصيصه لتستمتع بتجربة تعليمية سلسة وشخصية تناسب أسلوبك وطريقتك. استعد لخوض تجربة جديدة مع "فاهمك"... نحن هنا لنفهمك!',
              ),
            ],
          ),
          Positioned(
            bottom: 130,
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 2,
              effect: ExpandingDotsEffect(
                dotHeight: 11,
                dotWidth: 11,
                activeDotColor: AppColors.primary,
                dotColor: AppColors.primary50,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: CustomAnimated(
              child: PrimaryButton(
                text: _currentPage == 0 ? 'التالي' : 'لنبدأ',
                onParsed: () {
                  if (_currentPage == 0) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.ease,
                    );
                  } else {
                    // Navigator push replace
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChatAiView()),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
