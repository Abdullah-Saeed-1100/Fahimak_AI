import 'package:dartz/dartz.dart';
import 'package:fahimak_ai/core/errors/failures.dart';
import '../data/models/chat_message.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> sendMessage({
    // required String message,
    required List<ChatMessage> conversationMessages,
  });

  /// يجلب كل الرسائل المحفوظة محلياً بترتيب الإضافة
  Future<List<ChatMessage>> getAllMessages();

  Future<void> addMessage(ChatMessage msg);

  Future<void> clearMessages();
}
