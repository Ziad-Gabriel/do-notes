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

  final PageController controller=PageController();

  final List<Widget> listView = const [TasksListView(), CompletedTasksListView()];


  @override
  Widget build(BuildContext context) {
    final taskListView = ref.read(taskListProvider.notifier);
    
    return Column(
      children: [
       const DateSelection(),
        
        Expanded(
          child:Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
            child: PageView(
              controller: controller,
              children: listView,
              onPageChanged: (value) => taskListView.setNewIndex(value),
            ),
          ),
        ),
      ],
    );
  }
}
