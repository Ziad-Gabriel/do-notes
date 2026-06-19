import 'package:isar/isar.dart';

import 'package:do_note/core/model/data/tasks_data/tasks_data.dart';

class TasksDatabase {
  final Isar isar;

  TasksDatabase(this.isar);

  final List<TaskData> currentTasks = [];

  // Add task to the Tasks database
  Future<void> addTask(TaskData task) async {
    final newTask = TaskData()
      ..title = task.title
      ..description = task.description
      ..endDate = task.endDate
      ..priority = task.priority
      ..isCompleted = task.isCompleted;

    await isar.writeTxn(() async {
      await isar.taskDatas.put(newTask);
    });
  }

  // Update task in the Tasks database
  Future<void> updateTask(TaskData task) async {
    await isar.writeTxn(() async {
      await isar.taskDatas.put(task);
    });
  }

  // Delete task from the Tasks database
  Future<void> deleteTask(int id) async {
    await isar.writeTxn(() async {
      await isar.taskDatas.delete(id);
    });
  }

  // Get tasks from the Tasks database
  Future<List<TaskData>> fetchTasks() async {
    return await isar.taskDatas.where().findAll();
  }
}
