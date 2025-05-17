import 'package:fahimak_ai/features/chat_ai/widgets/messages_chat_widget.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/send_message_control.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/show_scroll_to_bottom_button_widget.dart';
import 'package:flutter/material.dart';

class ChatAiViewBody extends StatelessWidget {
  const ChatAiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("========= >> [ rebuild ChatAiViewBody ] << =========");
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              // messages
              MessagesChatWidget(),
              // show scroll to bottom button
              ShowScrollToBottomButtonWidget(),
            ],
          ),
        ),
        // text field and Send button
        SendMessageControl(),
      ],
    );
  }
}
