import 'package:isar/isar.dart';

part 'tasks_data.g.dart';

@Collection()
class TaskData {
  
  @Index()
  Id id = Isar.autoIncrement;
  
  late String title;
  late String description;
  late DateTime endDate;
  late int priority;
  bool isCompleted=false;
}
