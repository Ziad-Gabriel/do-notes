import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/utils/selected_date_state.dart';
import 'package:do_note/features/todo/data/tasks_data.dart';
import 'package:do_note/features/todo/widgets/task_list/content/task_description.dart';
import 'package:do_note/features/todo/widgets/task_list/content/task_title.dart';

class CompletedTasksListview extends ConsumerStatefulWidget {
  const CompletedTasksListview({super.key});

  @override
  ConsumerState<CompletedTasksListview> createState() =>
      _CompletedTasksListviewState();
}

class _CompletedTasksListviewState
    extends ConsumerState<CompletedTasksListview> {
  @override
  Widget build(BuildContext context) {
    final allTasks = ref.watch(completedTasksDataProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    final filteredTasks = allTasks.where((task) {
      return task.endDate.year == selectedDate.year &&
          task.endDate.month == selectedDate.month &&
          task.endDate.day == selectedDate.day;
    }).toList();
    return ListView.builder(
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        final task = filteredTasks[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: IntrinsicHeight(
            child: Card(
              elevation: 2,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TaskTitle(title: task.title),

                                TaskDescription(description: task.description),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
