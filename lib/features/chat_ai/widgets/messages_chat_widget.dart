import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesChatWidget extends StatelessWidget {
  const MessagesChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesChatState = context.select(
      (ChatCubit cubit) => cubit.state.messages,
    );
    debugPrint("========= >> [ rebuild MessagesChatWidget ] << =========");

    return ListView.builder(
      controller: context.read<ChatCubit>().scrollController,
      itemCount: messagesChatState.length,
      itemBuilder: (context, index) {
        final message = messagesChatState[index];
        return MessageBubble(message: message);
      },
    );
  }
}
