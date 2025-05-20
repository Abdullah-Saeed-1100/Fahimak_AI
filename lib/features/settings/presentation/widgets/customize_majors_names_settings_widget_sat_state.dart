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
      children: List.generate(
        MajorsNames.values.length,
        (index) => ChipWidget(
          name: MajorsNames.values[index].nameArabic,
          isSelected:
              CacheHelper.getString(CacheKeys.majorName) ==
              MajorsNames.values[index].name,
          onTap: () async {
            await CacheHelper.saveString(
              CacheKeys.majorName,
              MajorsNames.values[index].name,
            );
            setState(() {});
            debugPrint(
              "======= majorName key => ${CacheHelper.getString(CacheKeys.majorName)}",
            );
          },
        ),
      ),
    );
  }
}
