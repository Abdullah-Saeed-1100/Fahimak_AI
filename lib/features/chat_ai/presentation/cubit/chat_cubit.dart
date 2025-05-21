import 'dart:async';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_state.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/gemini_state.dart';
import 'package:fahimak_ai/features/chat_ai/domain/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dummy_data/dummy_data.dart';
import '../../data/models/chat_message.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  ChatCubit(this.chatRepo)
    : super(
        ChatState(messages: dummyMessages, showScrollToBottomButton: false),
      ) {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final atBottom =
        scrollController.position.pixels + 250 >=
        scrollController.position.maxScrollExtent;
    if (state.showScrollToBottomButton == atBottom) {
      emit(state.copyWith(showScrollToBottomButton: !atBottom));
    }
  }

  /// Scrolls to the bottom of the chat after the next frame.
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

  /// Sends a user message and handles the AI response.
  Future<void> sendMessage() async {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    // Add outgoing message
    final outgoingMessage = ChatMessage(
      text: text,
      timestamp: DateTime.now(),
      type: MessageType.outgoing,
    );
    emit(state.copyWith(messages: [...state.messages, outgoingMessage]));
    textController.clear();

    // Scroll to bottom after message is added
    scrollToBottom();

    // Set loading state for AI response
    emit(state.copyWith(geminiStatus: GeminiLoading()));

    // Get AI response
    final result = await chatRepo.sendMessage(
      // message: '',
      conversationMessages: state.messages,
    );

    result.fold(
      (error) {
        if (!isClosed) {
          emit(state.copyWith(geminiStatus: GeminiFailure(error.message)));
        }
      },
      (message) {
        if (!isClosed) {
          final incomingMessage = ChatMessage(
            text: message.trim(),
            timestamp: DateTime.now(),
            type: MessageType.incoming,
          );
          emit(
            state.copyWith(
              messages: [...state.messages, incomingMessage],
              geminiStatus: GeminiSuccess(),
            ),
          );
          scrollToBottom();
        }
      },
    );
  }

  /// Adds a dummy AI reply (for testing/demo).
  void addDummyReply() {
    Future.delayed(const Duration(seconds: 1), () {
      final reply = ChatMessage(
        text: "مرحبا! كيف يمكنني مساعدتك؟",
        timestamp: DateTime.now(),
        type: MessageType.incoming,
      );
      emit(
        state.copyWith(
          messages: [...state.messages, reply],
          geminiStatus: GeminiSuccess(),
        ),
      );
      scrollToBottom();
    });
  }

  @override
  Future<void> close() {
    textController.dispose();
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    return super.close();
  }
}
