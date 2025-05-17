import 'package:fahimak_ai/features/chat_ai/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/chat_cubit.dart';

class ChatAiViewBody extends StatelessWidget {
  const ChatAiViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("========= >> [ rebuild ChatAiViewBody ] << =========");
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [MessagesChatWidget(), ShowScrollToBottomButtonWidget()],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: context.read<ChatCubit>().textController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  onSubmitted: (_) => context.read<ChatCubit>().sendMessage(),
                ),
              ),
              const SizedBox(width: 8.0),
              FloatingActionButton(
                onPressed: () => context.read<ChatCubit>().sendMessage(),
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

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

class ShowScrollToBottomButtonWidget extends StatelessWidget {
  const ShowScrollToBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final showScrollToBottomButtonState = context.select(
      (ChatCubit cubit) => cubit.state.showScrollToBottomButton,
    );
    debugPrint(
      "========= >> [ rebuild ShowScrollToBottomButtonWidget ] << =========",
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        opacity: showScrollToBottomButtonState ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          icon: const Icon(Icons.arrow_downward),
          onPressed: () => context.read<ChatCubit>().scrollToBottom(),
        ),
      ),
    );
  }
}
