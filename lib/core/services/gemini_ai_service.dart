import 'package:fahimak_ai/core/helper_functions/get_majors_names.dart';
import 'package:fahimak_ai/core/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../errors/exceptions.dart';
import '../utils/api_keys.dart';

class GeminiAiService implements ChatService {
  @override
  Future<String> sendMessage({required String message, String? model}) async {
    final systemInstruction = getSystemInstructionsForMajorNameSelected();
    // مثال على إضافة GenerationConfig
    // final generationConfig = GenerationConfig(
    //   temperature: 0.7, // قيمة مثال
    //   maxOutputTokens: 1024, // قيمة مثال
    // );
    // مثال على إضافة SafetySettings
    // يسمح لك هذا بتحديد مستوى الحظر لفئات مختلفة من المحتوى (مثل الكلام الذي يحض على الكراهية، التحرش، إلخ).
    // final safetySettings = [
    //   SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium),
    //   // يمكنك إضافة المزيد من الإعدادات لفئات أخرى
    // ];
    try {
      final generativeModel = GenerativeModel(
        apiKey: ApiKeys.geminiAiApiKey,
        model: model ?? GeminiModels.gemini15Pro,
        systemInstruction:
            systemInstruction != null
                ? Content('model', [TextPart(systemInstruction)])
                : null,
        // generationConfig: generationConfig,
        // safetySettings: safetySettings,
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
  static const String gemini25FlashPreview =
      'gemini-2.5-flash-preview-04-17'; // مجاني
}
