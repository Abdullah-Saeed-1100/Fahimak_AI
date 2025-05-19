abstract class ChatService {
  Future<String> sendMessage({required String message, String? model});
}
