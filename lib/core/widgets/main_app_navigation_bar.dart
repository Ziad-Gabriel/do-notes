import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:z_money/features/todo/data/nav_task_list.dart';

class MainAppNavigationBar extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const MainAppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskListIndex = ref.watch(taskListProvider.notifier);
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      height: 80,
      notchMargin: 6.0,
      shape: CircularNotchedRectangle(),
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withAlpha(235),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(154, 106, 106, 106),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (selectedIndex != 0) {
                  onTap(0);
                }
              },
              icon: Icon(Icons.checklist_rounded),
            ),
            SizedBox(width: 48),
            IconButton(
              onPressed: () {
                if (selectedIndex != 1) {
                  onTap(1);
                }
                taskListIndex.setNewIndex(0);
              },
              icon: Icon(Icons.sticky_note_2_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
