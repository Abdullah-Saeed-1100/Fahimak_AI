import 'dart:async';

import 'package:fahimak_ai/features/chat_ai/cubit/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dummy_data/dummy_data.dart';
import '../models/chat_message.dart'; // For Future.delayed

class ChatCubit extends Cubit<ChatState> {
  ChatCubit()
    : super(
        ChatState(messages: dummyMessages, showScrollToBottomButton: false),
      ) {
    scrollController.addListener(_scrollListener);
  }

  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void _scrollListener() {
    final atBottom =
        scrollController.position.pixels + 100 >=
        scrollController.position.maxScrollExtent;
    if (state.showScrollToBottomButton == atBottom) {
      emit(state.copyWith(showScrollToBottomButton: !atBottom));
    }
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void sendMessage() {
    final text = textController.text.trim();
    if (text.isEmpty) {
      return;
    }
    final newMessage = ChatMessage(
      text: text,
      timestamp: DateTime.now(),
      type: MessageType.outgoing,
    );
    emit(state.copyWith(messages: [...state.messages, newMessage]));
  }

  void addDummyReply() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   // Simulated delay
    //   final reply = ChatMessage(
    //     text: 'This is a dummy reply.',
    //     timestamp: DateTime.now(),
    //     type: MessageType.incoming,
    //   );
    //   emit(ChatState(messages: [...state.messages, reply]));
    // });
    final reply = ChatMessage(
      text: 'This is a dummy reply.',
      timestamp: DateTime.now(),
      type: MessageType.incoming,
    );
    emit(state.copyWith(messages: [...state.messages, reply]));
  }

  @override
  Future<void> close() {
    textController.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();

    return super.close();
  }
}
