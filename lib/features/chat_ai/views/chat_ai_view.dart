import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/chat_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_colors.dart';
import '../../settings/views/settings_view.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary10,
        appBar: CustomAppBar(
          title: "الدردشة",
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SettingsView()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(AppImages.settings, height: 22),
              ),
            ),
          ],
        ),
        body: SafeArea(child: const ChatAiViewBody()),
      ),
    );
  }
}
