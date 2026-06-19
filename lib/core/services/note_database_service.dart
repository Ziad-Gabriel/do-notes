import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

import 'package:do_note/core/model/data/note_data/note_data.dart';

class NoteDatabaseService {
  final Isar isar;

  NoteDatabaseService(this.isar);

  final List<NoteData> myNotes = [];

  // Initialization of the Notes database
  // static Future<Isar> initialize() async {
  //   final dir = await getApplicationDocumentsDirectory();
  //   final existingInstance = Isar.getInstance();
  //   if (existingInstance != null) {
  //     return existingInstance;
  //   }
  //   return await Isar.open([NoteDataSchema], directory: dir.path);
  // }

  // Add task to the Notes database
  Future<void> addNote(NoteData note) async {
    final newNote = NoteData()
      ..title = note.title
      ..content = note.content;

    await isar.writeTxn(() async {
      await isar.noteDatas.put(newNote);
    });
  }

  // Update task in the Notes database
  Future<void> updateNote(NoteData task) async {
    await isar.writeTxn(() async {
      await isar.noteDatas.put(task);
    });
  }

  // Delete task from the Notes database
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() async {
      await isar.noteDatas.delete(id);
    });
  }

  // Get tasks from the Notes database
  Future<List<NoteData>> fetchNotes() async {
    return await isar.noteDatas.where().findAll();
  }
}
