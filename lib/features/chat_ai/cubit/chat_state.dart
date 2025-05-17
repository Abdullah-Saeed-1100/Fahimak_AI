import 'package:equatable/equatable.dart';
import '../models/chat_message.dart';

class ChatState extends Equatable {
  final List<ChatMessage> messages;
  final bool showScrollToBottomButton;

  const ChatState({
    required this.messages,
    this.showScrollToBottomButton = false,
  });

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? showScrollToBottomButton,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      showScrollToBottomButton:
          showScrollToBottomButton ?? this.showScrollToBottomButton,
    );
  }

  @override
  List<Object?> get props => [messages, showScrollToBottomButton];
}
