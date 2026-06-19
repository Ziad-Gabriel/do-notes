import 'package:do_note/core/services/notification_service.dart';
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
    title: Hero(
      tag: 'app bar title',
      child: Text(title, style: Theme.of(context).textTheme.titleLarge)),
    backgroundColor: Theme.of(context).colorScheme.primary,
    actions: [
      IconButton(
        onPressed: () {
          isDark = !isDark;
          themeNotifier.toggleTheme(isDark);
          NotificationService().showNotification( title: 'Change app theme', body: 'App theme has been changed' );
        },
        icon: isDark
            ? const Icon(Icons.sunny, size: 26)
            : const Icon(Icons.nightlight_round_outlined, size: 26),
      ),
    ],
  );
}
