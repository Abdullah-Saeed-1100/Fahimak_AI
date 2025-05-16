import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/features/settings/widgets/customize_majors_names_settings_widget_sat_state.dart';
import 'package:fahimak_ai/features/settings/widgets/customize_settings_widget_set_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

            // Customize TypesResult Settings
            CustomizeTypesResultSettingsWidgetSetState(),
            SizedBox(height: 12),

            // Customize Majors Settings
            CustomizeMajorsNamesSettingsWidgetSatState(),
          ],
        ),
      ),
    );
  }
}
