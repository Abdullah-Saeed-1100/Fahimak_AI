import 'package:fahimak_ai/core/helper_functions/get_majors_names.dart';
import 'package:fahimak_ai/core/services/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../features/chat_ai/data/models/chat_message.dart';
import '../errors/exceptions.dart';
import '../utils/api_keys.dart';

class GeminiAiService implements ChatService {
  @override
  Future<String> sendMessage({
    // required String message,
    String? model,
    required List<ChatMessage> conversationMessages,
  }) async {
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
    final List<Content> prompt = [];
    // 2) أضف جميع رسائل الـ history حسب النوع
    for (final msg in conversationMessages) {
      final role = (msg.type == MessageType.outgoing) ? 'user' : 'model';
      prompt.add(Content(role, [TextPart(msg.text)]));

      // 3) أضف الرسالة الجديدة كآخر مدخل في الـ prompt
      // prompt.add(Content('user', [TextPart(message)]));
    }
    try {
      final generativeModel = GenerativeModel(
        apiKey: ApiKeys.geminiAiApiKey,
        model: model ?? GeminiModels.gemini20Flash,
        systemInstruction:
            systemInstruction != null
                ? Content('system', [TextPart(systemInstruction)])
                : null,
        // generationConfig: generationConfig,
        // safetySettings: safetySettings,
      );
      //  قم باضافة الرسالة الجديدة كآخر مدخل في الـ prompt
      // prompt.add(Content('user', [TextPart(message)])); // انا اضفت الرسالة الجديدة مع المدخلات السابقة

      final response = await generativeModel.generateContent(prompt);
      return response.text?.trim() ?? 'لم أتلقَّ أي رد من الخادم.';
    } on GenerativeAIException catch (e) {
      debugPrint(
        "Error in sendMessage in GeminiAiService by Gemini API error: ${e.message}",
      );
      throw CustomException(message: _handleGeminiError(e));
    } on Exception catch (e) {
      debugPrint("Error in sendMessage in GeminiAiService: $e");
      throw CustomException(message: "حدث خطأ, يرجى المحاولة مرة اخرى");
    }
  }

  String _handleGeminiError(GenerativeAIException e) {
    final message = e.message.toLowerCase();

    if (message.contains('invalid api key')) {
      // عندما يكون مفتاح API الذي تستخدمه غير صالح
      return 'مفتاح API غير صالح. يرجى التحقق من إعدادات النظام.';
    } else if (message.contains('quota') || message.contains('exceeded')) {
      // تتجاوز الحد المسموح به يوميًا أو شهريًا من الاستعلامات (requests).
      // تصل إلى حد الاستخدام المجاني (Free Tier) أو خطة الدفع الخاصة بك.
      return 'تم تجاوز الحد اليومي أو الشهري للاستخدام. حاول لاحقًا أو تحقق من خطة الدفع.';
    } else if (message.contains('model not found')) {
      // عندما تحدد اسم نموذج (Model) غير صحيح أو غير متاح حاليًا
      return 'النموذج المطلوب غير متوفر. يرجى اختيار نموذج مختلف.';
    } else if (message.contains('permission denied')) {
      // تحدث عندما لا يمتلك حسابك الصلاحيات للوصول إلى نموذج معين.
      // تحاول الوصول إلى نموذج مدفوع وأنت على الخطة المجانية.
      return 'ليست لديك صلاحية الوصول إلى هذا النموذج. تحقق من صلاحيات حسابك.';
    } else if (message.contains('timeout')) {
      // استغرقت الاستجابة من خوادم Gemini وقتًا طويلاً.
      // واجهت الشبكة مشكلة أثناء إرسال أو استقبال البيانات.
      return 'انتهت مهلة الاستجابة. يرجى المحاولة مرة أخرى.';
    } else if (message.contains('resource exhausted')) {
      // تظهر عندما تكون خوادم Google AI تحت ضغط شديد
      //
      return 'الموارد غير كافية للرد حاليًا. حاول لاحقًا.';
    }

    return 'حدث خطأ في الاتصال بنموذج Gemini: ${e.message}';
  }
}

class GeminiModels {
  // static const String geminiPro = 'gemini-pro'; // مجاني
  // static const String gemini15Pro = 'gemini-1.5-pro'; // مجاني
  // static const String gemini15Flash = 'gemini-1.5-flash'; // مجاني
  // static const String gemini25FlashPreview =
  //     'gemini-2.5-flash-preview-04-17'; // مجاني
  // static const String gemini25ProPreview =
  //     'gemini-2.5-pro-preview-05-06'; // غير مجاني
  // static const String gemini15Pro = 'gemini-1.5-pro'; // مجاني

  // الي أقدر أستخدمهن
  // مرتبين من الافضل والاحدث
  static const String gemini25FlashPreview =
      'gemini-2.5-flash-preview-05-20'; // مجاني

  static const String gemini20Flash = 'gemini-2.0-flash'; // مجاني

  static const String gemini20FlashLite = 'gemini-2.0-flash-lite'; // مجاني

  static const String gemini15Flash = 'gemini-1.5-flash'; // مجاني
}
