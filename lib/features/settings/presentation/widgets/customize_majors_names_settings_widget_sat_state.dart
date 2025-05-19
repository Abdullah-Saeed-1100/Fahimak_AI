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
        getMajorsNames().length,
        (index) => ChipWidget(
          name: getMajorsNames()[index],
          isSelected:
              CacheHelper.getString(CacheKeys.majorName) ==
              getMajorsNames()[index],
          onTap: () async {
            await CacheHelper.saveString(
              CacheKeys.majorName,
              getMajorsNames()[index],
            );
            setState(() {});
          },
        ),
      ),
    );
  }
}
