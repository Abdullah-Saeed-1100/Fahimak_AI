import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import '../../../core/errors/failures.dart';
import '../../../core/services/chat_service.dart';
import '../../../core/services/gemini_ai_service.dart';
import '../domain/chat_repo.dart';
import 'models/chat_message.dart';

class ChatRepoImpl implements ChatRepo {
  final ChatService chatService;

  ChatRepoImpl({required this.chatService});
  @override
  Future<Either<Failure, String>> sendMessage({
    // required String message,
    required List<ChatMessage> conversationMessages,
  }) async {
    try {
      final response = await chatService.sendMessage(
        // message: message,
        model: GeminiModels.gemini25FlashPreview,
        conversationMessages: conversationMessages,
      );
      return Right(response);
    } on Exception catch (e) {
      debugPrint("Error in sendMessage in ChatRepoImpl: $e");
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
