import 'package:equatable/equatable.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/gemini_state.dart';
import '../models/chat_message.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final bool showScrollToBottomButton;
  final GeminiStatus geminiStatus;

  const ChatState({
    required this.messages,
    this.showScrollToBottomButton = false,
    this.geminiStatus = const GeminiInitial(),
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? showScrollToBottomButton,
    GeminiStatus? geminiStatus,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      showScrollToBottomButton:
          showScrollToBottomButton ?? this.showScrollToBottomButton,
      geminiStatus: geminiStatus ?? this.geminiStatus,
    );
  }

  @override
  List<Object?> get props => [messages, showScrollToBottomButton, geminiStatus];
}
