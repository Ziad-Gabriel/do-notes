import 'package:do_note/features/note/widgets/note_container/note_container.dart';
import 'package:do_note/providers/note_provider.dart';
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
            return NoteContainer(note: note);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }
}
