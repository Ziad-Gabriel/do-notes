import 'package:do_note/features/add_note/widgets/text_fields/note_text_field.dart';
import 'package:do_note/features/add_note/widgets/text_fields/note_title_text_field.dart';
import 'package:do_note/model/data/note_data/note_data.dart';
import 'package:do_note/providers/note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNoteView extends ConsumerStatefulWidget {

  final bool isNew;
  const AddNoteView({super.key, required this.isNew});

  @override
  ConsumerState<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends ConsumerState<AddNoteView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (titleController.text.isEmpty && contentController.text.isEmpty) {
          return; // Allow popping if both fields are empty
        } else if(widget.isNew) {
          final newNote = NoteData()
            ..title = titleController.text
            ..content = contentController.text;

          ref.read(noteProvider.notifier).addNote(newNote);
        }else{
          
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
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
              NoteTitleTextField(controller: titleController),
              Expanded(child: NoteTextField(controller: contentController)),
            ],
          ),
        ),
      ),
    );
  }
}
