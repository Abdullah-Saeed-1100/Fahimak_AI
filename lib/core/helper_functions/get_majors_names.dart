import '../utils/system_instructions_for_chat_costmize.dart';

enum MajorsNames { programming, engineering, medical, football }

const List<String> majorsNamesArabic = [
  "البرمجة",
  "الهندسة",
  "الطب",
  "كرة القدم",
];

extension MajorsNamesExt on MajorsNames {
  // get major name by arabic name
  String get nameArabic => majorsNamesArabic[index];

  String get systemInstructionsForChatCostmize {
    switch (this) {
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
