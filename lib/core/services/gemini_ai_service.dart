import 'package:fahimak_ai/core/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../errors/exceptions.dart';
import '../utils/api_keys.dart';

class GeminiAiService implements ChatService {
  @override
  Future<String> sendMessage({required String message, String? model}) async {
    try {
      final generativeModel = GenerativeModel(
        apiKey: ApiKeys.geminiAiApiKey,
        model: model ?? GeminiModels.gemini15Pro,
      );
      final content = [Content.text(message)];
      final response = await generativeModel.generateContent(content);
      return response.text ?? '';
    } on Exception catch (e) {
      debugPrint("Error in sendMessage in GeminiAiService: $e");
      throw CustomException(message: "حدث خطأ, يرجى المحاولة مرة اخرى");
    }
  }
}

class GeminiModels {
  static const String geminiPro = 'gemini-pro'; // مجاني
  static const String gemini15Pro = 'gemini-1.5-pro'; // مجاني
  static const String gemini15Flash = 'gemini-1.5-flash'; // مجاني
}
