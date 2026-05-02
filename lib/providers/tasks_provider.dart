import 'package:do_note/model/data/tasks_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final tasksListProvider = Provider<Isar>((ref) {
  throw UnimplementedError();
});

final tasksStreamProvider = StreamProvider<List<TaskData>>((ref) {
  final taskIsar = ref.watch(tasksListProvider);
  return taskIsar.taskDatas.where().watch(fireImmediately: true);
});
