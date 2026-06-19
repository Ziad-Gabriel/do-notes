import 'package:do_note/core/widgets/alert_dialog/delete_note_alert_dialog.dart';
import 'package:do_note/features/add_note/view/add_note_view.dart';
import 'package:do_note/features/note/widgets/note_container/note_container.dart';
import 'package:do_note/core/providers/note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteView extends ConsumerWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesAsync = ref.watch(noteProvider);

    return notesAsync.when(
      data: (notes) {
        if (notes.isEmpty) {
          return const Center(child: Text("No notes yet"));
        }
        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 8,
          ),
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNoteView(
                      isNew: false,
                      titleController: TextEditingController(text: note.title),
                      contentController: TextEditingController(
                        text: note.content,
                      ),
                      noteId: note.id,
                    ),
                  ),
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) => customDeleteAlertDialog(context, () {
                    ref.read(noteProvider.notifier).deleteNote(note.id);
                  }),
                );
              },
              child: NoteContainer(note: note),
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
