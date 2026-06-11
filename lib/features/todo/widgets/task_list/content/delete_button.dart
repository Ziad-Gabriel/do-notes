import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:do_note/model/data/tasks_data/tasks_data.dart';
import 'package:do_note/providers/tasks_provider.dart';

SlidableAction deleteButton(
  TaskData task,
  WidgetRef ref,
  BuildContext context,
) {
  return SlidableAction(
    onPressed: (context) {
      ref.read(tasksProvider.notifier).deleteTask(task.id);

      final undoSnackBar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        persist: false,
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primaryContainer.withAlpha(235),

        content: Text(
          'Task deleted',
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            ref.read(tasksProvider.notifier).addTask(task);
          },
        ),
      );

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(undoSnackBar);
    },

    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    icon: Icons.delete_outline,
  );
}
