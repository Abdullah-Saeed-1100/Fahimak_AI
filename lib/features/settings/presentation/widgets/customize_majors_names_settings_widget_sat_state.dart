import 'package:fahimak_ai/core/helper_functions/get_majors_names.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/chip_widget.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/customize_settings_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/cache_helper.dart';

class CustomizeMajorsNamesSettingsWidgetSatState extends StatefulWidget {
  const CustomizeMajorsNamesSettingsWidgetSatState({super.key});

  @override
  State<CustomizeMajorsNamesSettingsWidgetSatState> createState() =>
      _CustomizeMajorsNamesSettingsWidgetSatStateState();
}

class _CustomizeMajorsNamesSettingsWidgetSatStateState
    extends State<CustomizeMajorsNamesSettingsWidgetSatState> {
  @override
  Widget build(BuildContext context) {
    return CustomizeSettingsWidget(
      title: "يمكنني أن أقترح عليك بعض التخصصات التي يمكنك أن تسألني عنها...",
      subtitle:
          "( للحصول على نتائج أفضل قم بمسح محتوى الدردشة عند تغيير التخصص ).",
      children: List.generate(
        MajorsNames.values.length,
        (index) => CustomAnimatedForChipWidget(
          chipWidgetInput: ChipWidgetInput(
            name: MajorsNames.values[index].nameArabic,
            isSelected:
                CacheHelper.getString(CacheKeys.majorName) ==
                MajorsNames.values[index].name,
            onTap: () async {
              if (CacheHelper.getString(CacheKeys.majorName) !=
                  MajorsNames.values[index].name) {
                await CacheHelper.saveString(
                  CacheKeys.majorName,
                  MajorsNames.values[index].name,
                );
                setState(() {});
                debugPrint(
                  "======= majorName key => ${CacheHelper.getString(CacheKeys.majorName)}",
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
