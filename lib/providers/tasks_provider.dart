import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'package:do_note/model/data/tasks_data.dart';
import 'package:do_note/services/database_services.dart';

final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError();
});

final tasksProvider = AsyncNotifierProvider<TasksNotifier, List<TaskData>>(() {
  return TasksNotifier();
});

class TasksNotifier extends AsyncNotifier<List<TaskData>> {
  late TasksDatabase _tasksDatabase;

  @override
  Future<List<TaskData>> build() async {
    final isar = ref.watch(isarProvider);
    _tasksDatabase = TasksDatabase(isar);
    return _tasksDatabase.fetchTasks();
  }

  Future<void> addTask(TaskData task) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _tasksDatabase.addTask(task);
      return _tasksDatabase.fetchTasks();
    });
  }

  Future<void> toggleIsCompleted(TaskData task) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _tasksDatabase.isar.writeTxn(() async {
        task.isCompleted = !task.isCompleted;
        await _tasksDatabase.isar.taskDatas.put(task);
      });
      return _tasksDatabase.fetchTasks();
    });
  }

  Future<void> deleteTask(int id) async {
    await _tasksDatabase.isar.writeTxn(() async {
      await _tasksDatabase.isar.taskDatas.delete(id);
    });
    _tasksDatabase.fetchTasks();
  }
}
