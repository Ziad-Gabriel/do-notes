import 'package:do_note/features/add_note/widgets/text_fields/note_text_field.dart';
import 'package:do_note/features/add_note/widgets/text_fields/note_title_text_field.dart';
import 'package:flutter/material.dart';

class AddNoteView extends StatefulWidget {
  const AddNoteView({super.key});

  @override
  State<AddNoteView> createState() => _AddNoteViewState();
}

class _AddNoteViewState extends State<AddNoteView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            NoteTitleTextField(controller: titleController),
            Expanded(child: NoteTextField(controller: noteController)),
          ],
        ),
      ),
    );
  }
}
