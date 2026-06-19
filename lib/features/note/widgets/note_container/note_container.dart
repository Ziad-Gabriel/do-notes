import 'package:do_note/features/note/widgets/note_content/note_content.dart';
import 'package:do_note/features/note/widgets/note_content/note_title.dart';
import 'package:do_note/core/model/data/note_data/note_data.dart';
import 'package:flutter/material.dart';

class NoteContainer extends StatelessWidget {
  final NoteData note;
  const NoteContainer({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget() {
      if (note.title.isNotEmpty) {
        return Column(
          children: [
            NoteTitle(title: note.title),
            Divider(color: Theme.of(context).colorScheme.onPrimary),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    }

    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              titleWidget(),
              Expanded(child: NoteContent(content: note.content)),
            ],
          ),
        ),
      ),
    );
  }
}
