import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_state.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/gemini_state.dart';
import 'package:fahimak_ai/features/chat_ai/data/chat_repo_impl.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/chat_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/services/gemini_ai_service.dart';
import '../../../settings/presentation/views/settings_view.dart';
import '../../data/models/chat_message.dart';
import '../widgets/custom_theme_button.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final box = Hive.box<ChatMessage>(
          'messagesBox',
        ); // <— إحصل على الصندوق المفتوح

        return ChatCubit(
          ChatRepoImpl(chatService: GeminiAiService(), box: box),
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: "الدردشة",
          leading: CustomThemeButton(),
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
