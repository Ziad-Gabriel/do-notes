import 'package:do_note/providers/tasks_provider.dart';
import 'package:do_note/services/database_services.dart';
import 'package:do_note/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/theme/dark_theme.dart';
import 'package:do_note/core/theme/light_theme.dart';
import 'package:do_note/core/theme/theme_provider.dart';
import 'package:do_note/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotifaction();
  final isarInstance = await TasksDatabase.initialize();
  runApp(
    ProviderScope(
      overrides: [isarProvider.overrideWithValue(isarInstance)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Do Note',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: themeMode,
      home: const MainView(),
    );
  }
}
