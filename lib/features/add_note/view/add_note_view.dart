import 'package:do_note/features/add_note/widgets/text_fields/note_text_field.dart';
import 'package:do_note/features/add_note/widgets/text_fields/note_title_text_field.dart';
import 'package:do_note/core/model/data/note_data/note_data.dart';
import 'package:do_note/core/providers/note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNoteView extends ConsumerStatefulWidget {
  final int noteId;
  final TextEditingController titleController;
  final TextEditingController contentController;

  final bool isNew;
  const AddNoteView({
    super.key,
    required this.isNew,
    required this.titleController,
    required this.contentController,
    required this.noteId,
  });

  @override
  ConsumerState<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends ConsumerState<AddNoteView> {
  @override
  void dispose() {
    widget.titleController.dispose();
    widget.contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (widget.titleController.text.isEmpty &&
            widget.contentController.text.isEmpty) {
          return; // Allow popping if both fields are empty
        } else if (widget.isNew) {
          final newNote = NoteData()
            ..title = widget.titleController.text
            ..content = widget.contentController.text;

          ref.read(noteProvider.notifier).addNote(newNote);
        } else {
          final updatedNote = NoteData()
            ..id = widget.noteId
            ..title = widget.titleController.text
            ..content = widget.contentController.text;

          ref.read(noteProvider.notifier).updateNote(updatedNote);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Hero(
            tag: 'app bar title',
            child: Text('Note', style: Theme.of(context).textTheme.titleLarge),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8.0,
            bottom: 24.0,
            top: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              NoteTitleTextField(controller: widget.titleController),
              Expanded(
                child: NoteTextField(controller: widget.contentController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
