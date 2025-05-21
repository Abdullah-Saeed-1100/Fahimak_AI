import '../../features/chat_ai/data/models/chat_message.dart';

abstract class ChatService {
  Future<String> sendMessage({
    // required String message,
    String? model,
    required List<ChatMessage> conversationMessages,
  });
}
