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
    await _tasksDatabase.addTask(task);
    final updatedTasks = await _tasksDatabase.fetchTasks();
    state = AsyncData(updatedTasks);
  }

  Future<void> toggleIsCompleted(int id) async {
    await _tasksDatabase.isar.writeTxn(() async {
      final existing = await _tasksDatabase.isar.taskDatas.get(id);
      if (existing == null) return;
      final updated = TaskData()
        ..id = existing.id
        ..title = existing.title
        ..description = existing.description
        ..endDate = existing.endDate
        ..priority = existing.priority
        ..isCompleted = !existing.isCompleted;
      await _tasksDatabase.isar.taskDatas.put(updated);
    });
    final updatedTasks = await _tasksDatabase.fetchTasks();
    state = AsyncData(updatedTasks);
  }

  Future<void> deleteTask(int id) async {
    await _tasksDatabase.deleteTask(id);
    final updatedTasks = await _tasksDatabase.fetchTasks();
    state = AsyncData(updatedTasks);
  }
}
