import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/gemini_state.dart';
import '../models/chat_message.dart';
import 'message_bubble.dart';

class LoadingResponseMessageWidget extends StatelessWidget {
  final ChatMessage message;
  const LoadingResponseMessageWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    final geminiStatus = context.select(
      (ChatCubit cubit) => cubit.state.geminiStatus,
    );

    return geminiStatus is GeminiLoading
        ? MessageBubble(
          message: ChatMessage(
            text: '',
            timestamp: DateTime.now(),
            type: MessageType.incoming,
          ),
          isLoading: true,
        )
        : SizedBox.shrink();
  }
}
