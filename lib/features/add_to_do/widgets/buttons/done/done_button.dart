// import 'package:do_note/features/todo/data/tasks_data.dart';
import 'package:do_note/model/data/tasks_data.dart';
import 'package:do_note/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    // final addToDoTask = ref.read(tasksDataProvider.notifier).addTask;
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
          if (time == null) {
            TaskData newTaskData = TaskData();
            newTaskData = TaskData().copyWith(
              title: title.text,
              description: description.text,
              endDate: DateTime(date!.year, date!.month, date!.day),
              priority: priority,
            );
            await DatabaseServices.db.writeTxn(() async {
              await DatabaseServices.db.taskDatas.put(newTaskData);
            });
          } else {
            TaskData newTaskData = TaskData();
            newTaskData = TaskData().copyWith(
              title: title.text,
              description: description.text,
              endDate: DateTime(
                date!.year,
                date!.month,
                date!.day,
                time!.hour,
                time!.minute,
              ),
              priority: priority,
            );
            await DatabaseServices.db.writeTxn(() async {
              await DatabaseServices.db.taskDatas.put(newTaskData);
            });
          }
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
