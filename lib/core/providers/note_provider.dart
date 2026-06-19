import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import 'package:do_note/core/model/data/note_data/note_data.dart';
import 'package:do_note/core/services/note_database_service.dart';

final isarNotesProvider = Provider<Isar>((ref) {
  throw UnimplementedError();
});

final noteProvider = AsyncNotifierProvider<NoteProvider, List<NoteData>>(() {
  return NoteProvider();
});

class NoteProvider extends AsyncNotifier<List<NoteData>> {
  late NoteDatabaseService _noteDatabaseService;

  @override
  Future<List<NoteData>> build() async {
    final isar = ref.watch(isarNotesProvider);
    _noteDatabaseService = NoteDatabaseService(isar);
    return _noteDatabaseService.fetchNotes();
  }

  Future<void> addNote(NoteData note)async{
    await _noteDatabaseService.addNote(note);
    final updatedNotes = await _noteDatabaseService.fetchNotes();
    state = AsyncData(updatedNotes);
  }

  Future<void> updateNote(NoteData task) async {
    await _noteDatabaseService.updateNote(task); // Calls the Isar update
    final updatedTasks = await _noteDatabaseService.fetchNotes(); // Fetch fresh data
    state = AsyncData(updatedTasks); // Update UI
  }

  Future<void> deleteNote(int id) async {
    await _noteDatabaseService.deleteNote(id);
    final updatedTasks = await _noteDatabaseService.fetchNotes();
    state = AsyncData(updatedTasks);
  }
}
