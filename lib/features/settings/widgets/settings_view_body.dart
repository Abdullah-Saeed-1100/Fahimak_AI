import 'dart:ui';

import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 1, color: AppColors.primary50),
          SizedBox(height: 20),
          SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary15,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  SvgPicture.asset(AppImages.generate),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "أهلا, لو تبغاني أعطيك نتائج أكثر دقة تناسب ماتحتاجة, قم بتخصيص الإعدادات التالية لتناسب ماتريد...",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Column(
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      SvgPicture.asset(AppImages.generate),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "يمكنني أن أقترح عليك بعض التخصصات التي يمكنك أن تسألني عنها...",
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    textDirection: TextDirection.rtl,
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      majors().length,
                      (index) => ChipMajorWidget(
                        nameMajor: majors()[index],
                        isSelected: index == 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> majors() => [
    "التخصص الاول",
    "التخصص الثاني",
    "التخصص الثالث",
    "التخصص الرابع",
    "التخصص الخامس",
    "التخصص السادس",
    "التخصص السابع",
    "التخصص الثامن",
    "التخصص التاسع",
    "التخصص العاشر",
  ];
}

class ChipMajorWidget extends StatelessWidget {
  final String nameMajor;
  final bool? isSelected;
  const ChipMajorWidget({super.key, this.isSelected, required this.nameMajor});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: isSelected == true ? AppColors.primary : null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          nameMajor,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isSelected == true ? Colors.white : null,
            fontWeight: isSelected == true ? FontWeight.bold : null,
          ),
        ),
      ),
    );
  }
}

class Majors {
  final String name;
  final VoidCallback onTap;
  Majors({required this.name, required this.onTap});
}
