import 'package:do_note/model/data/tasks_data/tasks_data.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IsCompleted extends ConsumerWidget {
  final TaskData task;
  const IsCompleted({super.key, required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Checkbox(
      value: task.isCompleted,
      shape: const CircleBorder(),
      onChanged: (bool? value) {
        if (value == null) return;

        ref.read(tasksProvider.notifier).toggleIsCompleted(task.id);
        final completedSnackBar = SnackBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.antiAlias,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          persist: false,
          content: Text(
            value ? 'Task completed' : 'Task marked as incomplete',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(
            context,
          ).colorScheme.primaryContainer.withAlpha(235),
        );
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(completedSnackBar);
      },
    );
  }
}
