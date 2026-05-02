import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:do_note/model/data/tasks_data.dart';

class DatabaseServices {

  static late final Isar db;

  static Future<void> setup() async{
    final appDirection=await getApplicationDocumentsDirectory();
    db = await Isar.open(
      [TaskDataSchema], 
      directory: appDirection.path
    );
  }
}