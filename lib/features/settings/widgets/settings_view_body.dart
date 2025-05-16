import 'dart:ui';

import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helper_functions/get_majors_names.dart';
import '../../../core/helper_functions/get_types_result.dart';
import '../../../core/utils/app_colors.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
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
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
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
            CustomizeSettingsWidget(
              title: "كيف تحب أن تكون إجابتي؟",
              children: List.generate(
                getTypesResult().length,
                (index) => ChipWidget(
                  name: getTypesResult()[index],
                  isSelected: index == 0,
                ),
              ),
            ),
            SizedBox(height: 12),
            CustomizeSettingsWidget(
              title:
                  "يمكنني أن أقترح عليك بعض التخصصات التي يمكنك أن تسألني عنها...",
              children: List.generate(
                getMajorsNames().length,
                (index) => ChipWidget(
                  name: getMajorsNames()[index],
                  isSelected: index == 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomizeSettingsWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CustomizeSettingsWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(AppImages.generate),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String name;
  final bool? isSelected;
  const ChipWidget({super.key, this.isSelected, required this.name});

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
          name,
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
