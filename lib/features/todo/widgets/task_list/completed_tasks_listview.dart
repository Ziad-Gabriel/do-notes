import 'package:do_note/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final completedTasksAsync = ref.watch(tasksStreamProvider);

    return completedTasksAsync.when(
      data: (tasks) => ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final completedTasks = tasks.where((task) {
            return task.isCompleted;
          }).toList();
          final task = completedTasks[index];
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

                                  TaskDescription(
                                    description: task.description,
                                  ),
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
      ),
      loading: () => const CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }
}
