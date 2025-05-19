// lib/models/chat_message.dart

enum MessageType { incoming, outgoing }

class ChatMessage {
  final String text;
  final DateTime timestamp;
  final MessageType type;

  ChatMessage({
    required this.text,
    required this.timestamp,
    required this.type,
  });
}
