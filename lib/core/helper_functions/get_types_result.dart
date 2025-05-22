import '../services/gemini_ai_service.dart';

List<TypesResult> getTypesResult() => [
  TypesResult(
    typeNameAr: "أكثر إبداعاً وتفصيلاً",
    nameModelGemeni: GeminiModels.gemini25FlashPreview,
  ),
  TypesResult(
    typeNameAr: "أكثر توازناً",
    nameModelGemeni: GeminiModels.gemini20Flash,
  ),
  TypesResult(
    typeNameAr: "أكثر سرعةً وتبسيطاً",
    nameModelGemeni: GeminiModels.gemini20FlashLite,
  ),
];

class TypesResult {
  final String typeNameAr;
  final String nameModelGemeni;
  TypesResult({required this.typeNameAr, required this.nameModelGemeni});
}
