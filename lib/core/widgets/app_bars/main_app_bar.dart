import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/theme/theme_provider.dart';

AppBar mainAppBar(String title, BuildContext context, WidgetRef ref) {
  final themeNotifier = ref.read(themeProvider.notifier);
  final themeMode = ref.watch(themeProvider);
  bool isDark =
      (themeMode == ThemeMode.dark) ||
      (themeMode == ThemeMode.system &&
          MediaQuery.of(context).platformBrightness == Brightness.dark);
  return AppBar(
    title: Text(title, style: Theme.of(context).textTheme.titleLarge),
    actions: [
      IconButton(
        onPressed: () {
          isDark = !isDark;
          themeNotifier.toggleTheme(isDark);
        },
        icon: isDark
            ? const Icon(Icons.sunny, size: 26)
            : const Icon(Icons.nightlight_round_outlined, size: 26),
      ),
    ],
  );
}
