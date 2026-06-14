import 'package:do_note/core/utils/done_buttons/done_edit.dart';
import 'package:do_note/core/widgets/buttons/cancel/cancel_button.dart';
import 'package:do_note/core/widgets/buttons/choose_date/choose_date.dart';
import 'package:do_note/core/widgets/buttons/choose_time/choose_time.dart';
import 'package:do_note/core/widgets/buttons/main_button/main_button.dart';
import 'package:do_note/features/todo/widgets/edit_task_bottom_sheet/content/edit_priority/edit_priority.dart';
import 'package:do_note/features/todo/widgets/edit_task_bottom_sheet/content/text_fields/description_editor.dart';
import 'package:do_note/features/todo/widgets/edit_task_bottom_sheet/content/text_fields/title_editor.dart';
import 'package:do_note/model/data/tasks_data/tasks_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditTaskSheet extends ConsumerStatefulWidget {
  final TaskData task;

  const EditTaskSheet({super.key, required this.task});

  @override
  ConsumerState<EditTaskSheet> createState() => _EditTaskSheetState();
}

class _EditTaskSheetState extends ConsumerState<EditTaskSheet> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  DateTime? date;
  TimeOfDay? time;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the existing task title
    titleController = TextEditingController(text: widget.task.title);
    // Initialize the controller with the existing task description
    descriptionController = TextEditingController(
      text: widget.task.description,
    );

    date = widget.task.endDate;
    time = TimeOfDay(
      hour: widget.task.endDate.hour,
      minute: widget.task.endDate.minute,
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleEditor(titleController: titleController),
            const SizedBox(height: 10),
            DescriptionEditor(descriptionController: descriptionController),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ChooseDate(
                    selectedDate: date,
                    onDatePicked: (selectedDate) {
                      setState(() {
                        date = selectedDate;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ChooseTime(
                    selectedTime: time,
                    onTimePicked: (selectedTime) {
                      setState(() {
                        time = selectedTime;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EditPriority(
                      selectedPriority: widget.task.priority,
                      priority: 0,
                      onTap: () {
                        setState(() {
                          widget.task.priority = 0;
                        });
                      },
                    ),
                    EditPriority(
                      selectedPriority: widget.task.priority,
                      priority: 1,
                      onTap: () {
                        setState(() {
                          widget.task.priority = 1;
                        });
                      },
                    ),
                    EditPriority(
                      selectedPriority: widget.task.priority,
                      priority: 2,
                      onTap: () {
                        setState(() {
                          widget.task.priority = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CancelButton(),
                MainButton(
                  title: 'Done',
                  onPressed: doneEditTask(
                    taskId: widget.task.id,
                    title: titleController,
                    description: descriptionController,
                    date: date,
                    time: time,
                    priority: widget.task.priority,
                    context: context,
                    ref: ref,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
