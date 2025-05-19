import 'package:fahimak_ai/core/utils/app_theme/theme_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/views/chat_ai_view.dart';
import 'package:fahimak_ai/features/on_boarding/presentation/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/services/cache_helper.dart';
import 'core/utils/app_theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const FahimakAi());
}

class FahimakAi extends StatelessWidget {
  const FahimakAi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Fahimak AI -- dev.Abdullah Saeed Bagar',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            home:
                CacheHelper.getBool(CacheKeys.onboardingCompleted)
                    ? const ChatAiView()
                    : const OnBoardingViewBody(),
          );
        },
      ),
    );
  }
}
