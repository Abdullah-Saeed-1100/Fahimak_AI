import 'package:dartz/dartz.dart';
import 'package:fahimak_ai/core/errors/failures.dart';

import '../data/models/chat_message.dart';

abstract class ChatRepo {
  Future<Either<Failure, String>> sendMessage({
    // required String message,
    required List<ChatMessage> conversationMessages,
  });
}
