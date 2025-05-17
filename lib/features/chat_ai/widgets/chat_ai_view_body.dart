import 'package:fahimak_ai/features/chat_ai/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatAiViewBody extends StatefulWidget {
  const ChatAiViewBody({super.key});

  @override
  State<ChatAiViewBody> createState() => _ChatAiViewBodyState();
}

class _ChatAiViewBodyState extends State<ChatAiViewBody> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToBottomButton = false;

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <
          _scrollController.position.maxScrollExtent) {
        setState(() => _showScrollToBottomButton = true);
      } else {
        setState(() => _showScrollToBottomButton = false);
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(BuildContext context) {
    if (_textController.text.trim().isNotEmpty) {
      context.read<ChatCubit>().sendMessage(_textController.text.trim());
      _textController.clear();
      _scrollToBottom();
      Future.delayed(const Duration(seconds: 1), () {
        context.read<ChatCubit>().addDummyReply();
        _scrollToBottom();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Stack(
                children: [
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return MessageBubble(message: message);
                    },
                  ),
                  if (_showScrollToBottomButton)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: AnimatedOpacity(
                        opacity: _showScrollToBottomButton ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_downward),
                          onPressed: _scrollToBottom,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                  onSubmitted: (_) => _sendMessage(context),
                ),
              ),
              const SizedBox(width: 8.0),
              FloatingActionButton(
                onPressed: () => _sendMessage(context),
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
