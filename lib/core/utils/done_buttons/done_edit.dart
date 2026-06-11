import 'package:do_note/core/utils/validators/add_task/title_valid.dart';
import 'package:do_note/core/widgets/alert_dialog/alert_dialog.dart';
import 'package:do_note/model/data/tasks_data/tasks_data.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Function() doneEditTask({
  required int taskId,
  required TextEditingController? title,
  required TextEditingController? description,
  required DateTime? date,
  required TimeOfDay? time,
  required int? priority,
  required BuildContext context,
  required WidgetRef ref,
}) {
  return () async {
    if (!titleValid(title: title!.text)) {
      showDialog(
        context: context,
        builder: (context) =>
            customAlertDialog(context, message: 'Enter correct title'),
      );
    } else {
      final editDateTime = DateTime(
        date!.year,
        date.month,
        date.day,
        time?.hour ?? 0,
        time?.minute ?? 0,
      );

      final updatedTask = TaskData()
        ..id = taskId
        ..title = title.text
        ..description = description?.text ?? ''
        ..endDate = editDateTime
        ..priority = priority!;

      await ref.read(tasksProvider.notifier).updateTask(updatedTask);

      if (!context.mounted) return;

      Navigator.pop(context);

      final editSnackBar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 5),
        persist: false,
        content: Text(
          'Task edited',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        backgroundColor: Theme.of(
          context,
        ).colorScheme.primaryContainer.withAlpha(235),
      );

      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(editSnackBar);
    }
  };
}
