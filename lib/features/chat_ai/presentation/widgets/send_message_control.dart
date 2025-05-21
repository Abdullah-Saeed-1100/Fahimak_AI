import 'package:fahimak_ai/features/chat_ai/presentation/widgets/send_message_button.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/text_filed_message.dart';
import 'package:flutter/material.dart';

class SendMessageControl extends StatelessWidget {
  const SendMessageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(child: TextFiledMessage()),
          const SizedBox(width: 8.0),
          SendMessageButton(),
        ],
      ),
    );
  }
}
