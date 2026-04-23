import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final StateNotifierProvider<ThemeNotifier, ThemeMode> themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system);

  void toggleTheme(bool isDarkMode) {
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
