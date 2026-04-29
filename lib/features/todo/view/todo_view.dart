import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/features/todo/data/nav_task_list.dart';
import 'package:do_note/features/todo/widgets/date_selection.dart';
import 'package:do_note/features/todo/widgets/nav_top_bar/nav_top_bar_container.dart';
import 'package:do_note/features/todo/widgets/task_list/completed_tasks_listview.dart';
import 'package:do_note/features/todo/widgets/task_list/tasks_listview.dart';

class ToDoView extends ConsumerStatefulWidget {
  const ToDoView({super.key});

  @override
  ConsumerState<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends ConsumerState<ToDoView> {
  late PageController controller;

  int _currentIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  final List<Widget> listview = [TasksListView(), CompletedTasksListview()];

  @override
  Widget build(BuildContext context) {
    final taskListView = ref.read(taskListProvider.notifier);
    final taskListIndex = ref.watch(taskListProvider);
    _currentIndex = taskListIndex;

    return Column(
      children: [
        DateSelection(),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: NavTopBarContainer(controller: controller),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
            child: PageView(
              controller: controller,
              children: listview,
              onPageChanged: (value) => taskListView.setNewIndex(value),
            ),
          ),
        ),
      ],
    );
  }
}
