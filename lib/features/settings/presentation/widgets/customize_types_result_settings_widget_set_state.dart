import 'package:fahimak_ai/core/helper_functions/get_types_result.dart';
import 'package:fahimak_ai/core/services/cache_helper.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/chip_widget.dart';
import 'package:fahimak_ai/features/settings/presentation/widgets/customize_settings_widget.dart';
import 'package:flutter/material.dart';

class CustomizeTypesResultSettingsWidgetSetState extends StatefulWidget {
  const CustomizeTypesResultSettingsWidgetSetState({super.key});

  @override
  State<CustomizeTypesResultSettingsWidgetSetState> createState() =>
      _CustomizeTypesResultSettingsWidgetSetStateState();
}

class _CustomizeTypesResultSettingsWidgetSetStateState
    extends State<CustomizeTypesResultSettingsWidgetSetState> {
  @override
  Widget build(BuildContext context) {
    return CustomizeSettingsWidget(
      title: "كيف تحب أن تكون إجابتي؟",
      children: List.generate(
        getTypesResult().length,
        (index) => CustomAnimatedForChipWidget(
          chipWidgetInput: ChipWidgetInput(
            name: getTypesResult()[index].typeNameAr,
            isSelected:
                CacheHelper.getString(CacheKeys.resultType) ==
                getTypesResult()[index].nameModelGemeni,
            onTap: () async {
              await CacheHelper.saveString(
                CacheKeys.resultType,
                getTypesResult()[index].nameModelGemeni,
              );
              setState(() {});
              debugPrint(
                "======= resultType key => ${CacheHelper.getString(CacheKeys.resultType)}",
              );
            },
          ),
        ),
      ),
    );
  }
}
