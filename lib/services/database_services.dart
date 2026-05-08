import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:do_note/model/data/tasks_data.dart';

class TasksDatabase {
  final Isar isar;

  TasksDatabase(this.isar);

  final List<TaskData> currentTasks = [];

  // Initialization of the database
  static Future<Isar> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final existingInstance = Isar.getInstance();
    if (existingInstance != null) {
      return existingInstance;
    }
    return await Isar.open([TaskDataSchema], directory: dir.path);
  }

  // Add task to the database
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

  // Update task in the database
  Future<void> updateTask(TaskData task) async {
    await isar.writeTxn(() async {
      await isar.taskDatas.put(task);
    });
  }

  // Delete task from the database
  Future<void> deleteTask(int id) async {
    await isar.writeTxn(() async {
      await isar.taskDatas.delete(id);
    });
    fetchTasks();
  }

  // Get tasks from the database
  Future<List<TaskData>> fetchTasks() async {
    final tasks = await isar.taskDatas.where().findAll();
    return tasks;
  }
}
