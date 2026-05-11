import 'package:do_note/features/todo/widgets/task_list/completed_tasks_listview.dart';
import 'package:do_note/features/todo/widgets/task_list/tasks_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/providers/nav_task_list.dart';
import 'package:do_note/features/todo/widgets/date_selection.dart';


class ToDoView extends ConsumerStatefulWidget {

  final PageController controller;
  
  const ToDoView({super.key,required this.controller});

  @override
  ConsumerState<ToDoView> createState() => _ToDoViewState();
}

class _ToDoViewState extends ConsumerState<ToDoView> {


  final listview = const [TasksListView(), CompletedTasksListview()];

  

  

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
              controller: widget.controller,
              children: listview,
              onPageChanged: (value) => taskListView.setNewIndex(value),
            ),
          ),
        ),
      ],
    );
  }
}
