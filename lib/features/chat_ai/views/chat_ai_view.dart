import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/chat_state.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/gemini_state.dart';
import 'package:fahimak_ai/features/chat_ai/data/chat_repo_impl.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/chat_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/services/gemini_ai_service.dart';
import '../../../core/utils/app_colors.dart';
import '../../settings/views/settings_view.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ChatCubit(ChatRepoImpl(chatService: GeminiAiService())),
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
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(AppImages.settings, height: 22),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: BlocListener<ChatCubit, ChatState>(
            listenWhen: (previous, current) {
              // ينفذ فقط إذا تغيرت القيمة من أي شيء إلى GeminiFailure
              return current.geminiStatus is GeminiFailure &&
                  previous.geminiStatus != current.geminiStatus;
            },
            listener: (context, state) {
              if (state.geminiStatus is GeminiFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      (state.geminiStatus as GeminiFailure).errMessage,
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              }
            },
            child: const ChatAiViewBody(),
          ),
        ),
      ),
    );
  }
}
