import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_theme/theme_cubit.dart';

class CustomThemeButton extends StatelessWidget {
  const CustomThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeCubit, ThemeMode, ThemeMode>(
      selector: (mode) => mode,
      builder: (context, mode) {
        return IconButton(
          onPressed: () => context.read<ThemeCubit>().toggleTheme(),
          icon: SvgPicture.asset(
            mode == ThemeMode.dark ? AppImages.darkMode : AppImages.lightMode,
            height: 22,
            colorFilter: ColorFilter.mode(
              Theme.of(context).appBarTheme.actionsIconTheme!.color!,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}
