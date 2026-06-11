import 'package:do_note/features/add_note/view/add_note_view.dart';
import 'package:flutter/material.dart';

import 'package:do_note/features/add_to_do/view/add_to_do_view.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget mainFloatingActionButton(BuildContext context) {
  return SpeedDial(
    icon: Icons.add_outlined,
    activeIcon: Icons.close_rounded,
    backgroundColor: Theme.of(context).colorScheme.primary,
    foregroundColor: Theme.of(context).colorScheme.onPrimary,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    children: [
      SpeedDialChild(
        child: const Icon(Icons.add_task_rounded),
        label: 'Add To Do',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddToDoView()),
        ),
      ),
      SpeedDialChild(
        child: const Icon(Icons.note_add_rounded),
        label: 'Add Note',
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddNoteView()),
        ),
      ),
    ],
  );
}
