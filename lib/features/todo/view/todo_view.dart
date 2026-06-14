import 'package:do_note/features/todo/widgets/task_list/buttons/task_nav_button.dart';
import 'package:do_note/features/todo/widgets/task_list/completed_tasks_list_view.dart';
import 'package:do_note/features/todo/widgets/task_list/tasks_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/providers/nav_task_list.dart';
import 'package:do_note/features/todo/widgets/date_selection.dart';

class ToDoView extends ConsumerStatefulWidget {
  const ToDoView({super.key});

  @override
  ConsumerState<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends ConsumerState<ToDoView> {
  final PageController controller = PageController();
  final List<Widget> listView = const [
    TasksListView(),
    CompletedTasksListView(),
  ];

  @override
  Widget build(BuildContext context) {
    final taskListView = ref.read(taskListProvider.notifier);
    final currentIndex = ref.watch(taskListProvider);

    return Column(
      children: [
        const DateSelection(),
        Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => taskListView.setNewIndex(0),
                  child: TaskNavButton(
                    currentIndex: currentIndex,
                    selectIndex: 0,
                  ),
                ),
                GestureDetector(
                  onTap: () => taskListView.setNewIndex(1),
                  child: TaskNavButton(
                    currentIndex: currentIndex,
                    selectIndex: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
            child: listView[currentIndex],
          ),
        ),
      ],
    );
  }
}
