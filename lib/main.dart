import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

import 'package:do_note/model/data/note_data/note_data.dart';
import 'package:do_note/model/data/tasks_data/tasks_data.dart';
import 'package:do_note/providers/note_provider.dart';
import 'package:do_note/features/profile_singing/sing_up/view/sing_up_view.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:do_note/core/theme/dark_theme.dart';
import 'package:do_note/core/theme/light_theme.dart';
import 'package:do_note/core/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await NotificationService().initNotification();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [TaskDataSchema, NoteDataSchema],
    directory: dir.path,
    inspector: true, // for debugging
  );
  runApp(
    ProviderScope(
      overrides: [
        isarTasksProvider.overrideWithValue(isar),
        isarNotesProvider.overrideWithValue(isar),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      title: 'Do Note',
      debugShowCheckedModeBanner: false,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: themeMode,
      home: const SingUpView(),
      // const MainView(),
    );
  }
}
