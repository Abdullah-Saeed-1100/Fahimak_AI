import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/features/settings/presentation/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => SettingsView()));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            AppImages.settings,
            height: 22,
            colorFilter: ColorFilter.mode(
              Theme.of(context).appBarTheme.actionsIconTheme!.color!,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
