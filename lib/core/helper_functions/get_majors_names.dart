import '../services/cache_helper.dart';
import '../utils/system_instructions_for_chat_costmize.dart';

enum MajorsNames { general, programming, engineering, medical, football }

const List<String> majorsNamesArabic = [
  "عام",
  "البرمجة",
  "الهندسة",
  "الطب",
  "كرة القدم",
];

extension MajorsNamesExt on MajorsNames {
  // get major name by arabic name
  String get nameArabic => majorsNamesArabic[index];

  String? get systemInstructionsForChatCostmize {
    switch (this) {
      case MajorsNames.general:
        return null;
      case MajorsNames.programming:
        return SystemInstructionsForChatCostmize.programmingMajor;
      case MajorsNames.engineering:
        return SystemInstructionsForChatCostmize.engineeringMajor;
      case MajorsNames.medical:
        return SystemInstructionsForChatCostmize.medicalMajor;
      case MajorsNames.football:
        return SystemInstructionsForChatCostmize.footballMajor;
    }
  }
}

String? getSystemInstructionsForMajorNameSelected() {
  final majorName = CacheHelper.getString(CacheKeys.majorName);
  if (majorName == null) return null;

  for (final major in MajorsNames.values) {
    if (major.name == majorName) {
      return major.systemInstructionsForChatCostmize;
    }
  }
  return null;
}
