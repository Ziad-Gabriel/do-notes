import 'package:flutter_riverpod/legacy.dart';

StateNotifierProvider<TasksWidgetNotifier, int> taskListProvider =
    StateNotifierProvider<TasksWidgetNotifier, int>(
      (ref) => TasksWidgetNotifier(),
    );

class TasksWidgetNotifier extends StateNotifier<int> {
  TasksWidgetNotifier() : super(0);

  void setNewIndex(int newIndex) {
    state = newIndex;
  }
}
