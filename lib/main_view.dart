import 'package:do_note/core/widgets/app_bars/main_app_navigation_bar.dart';
import 'package:do_note/providers/nav_task_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/widgets/buttons/floating_button.dart';
import 'package:do_note/core/widgets/app_bars/main_app_bar.dart';
import 'package:do_note/features/todo/view/todo_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  late PageController controller;

  int _currentIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listIndex = ref.watch(taskListProvider);
    final setListIndex = ref.watch(taskListProvider.notifier);
    _currentIndex = listIndex;
    return Scaffold(
      extendBody: true,
      appBar: mainAppBar('ToDo', context, ref),
      body: ToDoView(controller: controller),
      floatingActionButton: mainFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainAppNavigationBar(
        selectedIndex: listIndex,
        onTap: (index) {
          setListIndex.setNewIndex(index);

          controller.animateToPage(
            index,
            duration:const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
