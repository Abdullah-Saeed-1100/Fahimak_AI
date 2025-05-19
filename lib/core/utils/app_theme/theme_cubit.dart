import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_getInitialTheme());

  static ThemeMode _getInitialTheme() {
    final isDarkMode = CacheHelper.getBool(CacheKeys.isDarkMode);
    if (isDarkMode) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  Future<void> toggleTheme() async {
    if (state == ThemeMode.dark) {
      await CacheHelper.saveBool(CacheKeys.isDarkMode, false);
      emit(ThemeMode.light);
    } else {
      await CacheHelper.saveBool(CacheKeys.isDarkMode, true);
      emit(ThemeMode.dark);
    }
  }
}

enum ThemeModeOption { dark, light, system }
