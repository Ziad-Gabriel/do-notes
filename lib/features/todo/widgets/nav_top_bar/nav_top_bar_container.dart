import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/features/todo/data/nav_task_list.dart';
import 'package:do_note/features/todo/widgets/nav_top_bar/content/nav_top_bar_button.dart';

class NavTopBarContainer extends ConsumerStatefulWidget {
  final PageController controller;

  const NavTopBarContainer({super.key, required this.controller});

  @override
  ConsumerState<NavTopBarContainer> createState() => _NavTopBarContainerState();
}

class _NavTopBarContainerState extends ConsumerState<NavTopBarContainer> {
  @override
  Widget build(BuildContext context) {
    final listIndex = ref.watch(taskListProvider);
    final setListIndex = ref.watch(taskListProvider.notifier);
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: const Color.fromARGB(255, 127, 127, 127))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: NavTopBarButton(
              title: 'ToDo',
              icon: Icons.check_circle_outline_outlined,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: listIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : const Color.fromARGB(255, 189, 189, 189),
              onPressed: () {
                setState(() {
                  if (listIndex == 1) {
                    setListIndex.setNewIndex(0);
                  }
                });
                widget.controller.animateToPage(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          SizedBox(height: double.infinity, width: 2),
          Expanded(
            child: NavTopBarButton(
              title: 'Completed',
              icon: Icons.check_circle,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: listIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : const Color.fromARGB(255, 189, 189, 189),
              onPressed: () {
                setState(() {
                  if (listIndex == 0) {
                    setListIndex.setNewIndex(1);
                  }
                });
                widget.controller.animateToPage(
                  1,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
