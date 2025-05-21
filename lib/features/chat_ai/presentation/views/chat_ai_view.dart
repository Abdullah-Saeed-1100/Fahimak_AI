import 'package:fahimak_ai/core/widgets/custom_app_bar.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/chat_ai_view_body_bloc_listener.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/setting_button.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_theme_button.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "الدردشة",
        leading: CustomThemeButton(),
        actions: [SettingButton()],
      ),
      body: SafeArea(child: ChatAiViewBodyBlocListener()),
    );
  }
}
