import 'package:do_note/features/todo/widgets/edit_task_bottom_sheet/edit_task_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:do_note/model/data/tasks_data.dart';

SlidableAction editButton(TaskData task, WidgetRef ref, BuildContext context) {
  return SlidableAction(
    onPressed: (context) {
      showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        isDismissible: true,
        showDragHandle: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: EditTaskSheet(task: task),
          );
        },
      );
    },

    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    icon: Icons.edit_outlined,
  );
}
