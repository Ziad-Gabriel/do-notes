import 'package:isar/isar.dart';

part 'note_data.g.dart';

@Collection()
class NoteData {
  @Index()
  Id id = Isar.autoIncrement;

  late String title;
  late String content;
}
