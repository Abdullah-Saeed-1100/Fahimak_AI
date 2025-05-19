import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/customize_majors_names_settings_widget_sat_state.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/customize_types_result_settings_widget_set_state.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/header_setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            // Divider(height: 1, color: AppColors.primary50),
            SizedBox(height: 20),
            SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
            HeaderSettingWidget(
              text:
                  "أهلا, لو تبغاني أعطيك نتائج أكثر دقة تناسب ماتحتاجة, قم بتخصيص الإعدادات التالية لتناسب ماتريد...",
            ),
            SizedBox(height: 12),

            // Customize TypesResult Settings
            CustomizeTypesResultSettingsWidgetSetState(),
            SizedBox(height: 12),

            // Customize Majors Settings
            CustomizeMajorsNamesSettingsWidgetSatState(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
