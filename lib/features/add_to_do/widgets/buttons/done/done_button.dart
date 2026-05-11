import 'package:do_note/providers/priority_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/model/data/tasks_data.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:do_note/core/utils/validators/add_task/title_valid.dart';
import 'package:do_note/core/widgets/alert_dialog/alert_dialog.dart';

class DoneButton extends ConsumerWidget {
  final TextEditingController title;
  final TextEditingController description;
  final DateTime? date;
  final TimeOfDay? time;
  final int priority;

  const DoneButton({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.priority,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        if (!titleValid(title: title.text) && date == null) {
          showDialog(
            context: context,
            builder: (context) => customAlertDialog(
              context,
              message: 'Enter correct title and choose date',
            ),
          );
        } else if (!titleValid(title: title.text)) {
          showDialog(
            context: context,
            builder: (context) =>
                customAlertDialog(context, message: 'Enter correct title'),
          );
        } else if (date == null) {
          showDialog(
            context: context,
            builder: (context) =>
                customAlertDialog(context, message: 'Choose date'),
          );
        } else {

        final finalDateTime = DateTime(
          date!.year,
          date!.month,
          date!.day,
          time?.hour ?? 0,
          time?.minute ?? 0,
        );

        final newTask = TaskData()
          ..title = title.text
          ..description = description.text
          ..endDate = finalDateTime
          ..priority = priority;

        await ref.read(tasksProvider.notifier).addTask(newTask);
ref.read(priorityProvider.notifier).setPriority(1);

          if (!context.mounted) return;

          Navigator.pop(context);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text('Done', style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
