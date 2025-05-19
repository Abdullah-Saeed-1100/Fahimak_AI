import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
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
          icon: AnimatedRotation(
            turns: mode == ThemeMode.dark ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              mode == ThemeMode.dark ? Icons.dark_mode : Icons.wb_sunny,
              size: 24,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );
  }
}
