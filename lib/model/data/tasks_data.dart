import 'package:isar/isar.dart';

part 'tasks_data.g.dart';

@Collection()
class TaskData {
  
  Id id = Isar.autoIncrement;
  late String title;
  late String description;
  late DateTime endDate;
  late int priority;
  final bool isCompleted=false;

  TaskData copyWith({
    String? title,
    String? description,
    DateTime? endDate,
    int? priority,
  }) {
    return TaskData()
      ..id = id
      ..title = title!
      ..description = description ?? ''
      ..endDate = endDate!
      ..priority = priority!;
  }
}
