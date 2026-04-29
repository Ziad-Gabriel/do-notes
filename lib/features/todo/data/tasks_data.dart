import 'package:flutter_riverpod/legacy.dart';

class TaskData {
  final String title;
  final String description;
  final DateTime endDate;
 final bool isCompleted;
  final int priority;
  TaskData({
    required this.title,
    required this.description,
    required this.endDate,
    required this.isCompleted,
    required this.priority,
  });
}

StateNotifierProvider<TasksDataNotifier, List<TaskData>> tasksDataProvider =
    StateNotifierProvider<TasksDataNotifier, List<TaskData>>(
      (ref) => TasksDataNotifier(),
    );

class TasksDataNotifier extends StateNotifier<List<TaskData>> {
  TasksDataNotifier() : super(tasksList);

  void addTask(TaskData task) {
    state = [task, ...state];
  }
}

StateNotifierProvider<CompletedTasksDataNotifier, List<TaskData>>
completedTasksDataProvider =
    StateNotifierProvider<CompletedTasksDataNotifier, List<TaskData>>(
      (ref) => CompletedTasksDataNotifier(),
    );

class CompletedTasksDataNotifier extends StateNotifier<List<TaskData>> {
  CompletedTasksDataNotifier() : super(completedTasksList);

  void addTask(TaskData task) {
    state = [task, ...state];
  }
}

List<TaskData> tasksList = [
  TaskData(
    title: 'Task 1',
    description: 'the task 1 description',
    endDate: DateTime.now(),
    isCompleted: false,
    priority: 0,
  ),
  TaskData(
    title: 'Task 2',
    description:
        'the task 1 desiav uiu dubngfngfv  js dcv u uid c sac ou iodcnsqoi chi udsandfkbnufvbini fn  bubububviondivb dubu uivuhvivnsiu obuocbi vusb juiv sbj idyv scihasuig duob uvci iv sgcuisbuvcyvsucbusvcvskjbcui dbuiv cusjsacoubs hisbcuisvycc sbhnjcz ffbd bu',
    endDate: DateTime.now(),
    isCompleted: false,
    priority: 1,
  ),
  TaskData(
    title: 'Task 3',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 1)),
    isCompleted: false,
    priority: 2,
  ),
  TaskData(
    title: 'Task 4',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 1)),
    isCompleted: false,
    priority: 0,
  ),
  TaskData(
    title: 'Task 5',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 1)),
    isCompleted: false,
    priority: 0,
  ),
  TaskData(
    title: 'Task 6',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 2)),
    isCompleted: false,
    priority: 0,
  ),
];

List<TaskData> completedTasksList = [
  TaskData(
    title: 'Task 11',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 0)),
    isCompleted: true,
    priority: 2
  ),
  TaskData(
    title: 'Task 14',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 0)),
    isCompleted: true,
    priority: 0
  ),
  TaskData(
    title: 'Task 12',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 1)),
    isCompleted: true,
    priority: 0,
  ),
  TaskData(
    title: 'Task 13',
    description: 'the task 1 description',
    endDate: DateTime.now().add(Duration(days: 2)),
    isCompleted: true,
    priority: 0,
  ),
];
