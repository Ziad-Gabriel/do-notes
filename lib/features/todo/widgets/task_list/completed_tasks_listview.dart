import 'package:do_note/features/todo/widgets/task_list/task_container/task_container.dart';
import 'package:do_note/providers/tasks_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



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
    final completedTasksAsync = ref.watch(tasksProvider);

    return completedTasksAsync.when(
      data: (tasks) {
        final completedTasks = tasks.where((task) {
          return task.isCompleted;
        }).toList();

        return Column(
          children: [
            Text('Completed Tasks', style: Theme.of(context).textTheme.titleLarge),
            if (completedTasks.isEmpty)
              const Expanded(
                child: Center(child: Text("No Completed tasks")),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    final task = completedTasks[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: IntrinsicHeight(
                        child: Card(
                          elevation: 2,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: TaskContainer(task: task),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        );
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
error: (e, st) => Scaffold(body: Center(child: Text('Error: $e'))),
    );
  }
}
