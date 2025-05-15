import 'package:fahimak_ai/core/widgets/custom_animated.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAnimated(isFromUp: true, child: Image.asset(image)),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 16),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
