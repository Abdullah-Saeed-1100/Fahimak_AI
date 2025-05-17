import '../models/chat_message.dart';

class ChatState {
  final List<ChatMessage> messages;

  const ChatState({required this.messages});

  ChatState copyWith({
    List<ChatMessage>? messages,
  }) => ChatState(messages: messages ?? this.messages);
}