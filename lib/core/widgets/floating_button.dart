import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:do_note/features/add_to_do/view/add_to_do_view.dart';

Widget mainFloatingActionButton(BuildContext context) {
  return SpeedDial(
    spaceBetweenChildren: 8,
    icon: Icons.add,
    activeIcon: Icons.close,
    backgroundColor: Theme.of(context).colorScheme.primary,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    children: [
      SpeedDialChild(
        child: const Icon(Icons.note_add_outlined),
        label: 'Add Note',
        onTap: () {},
      ),
      SpeedDialChild(
        child: const Icon(Icons.add_task_outlined),
        label: 'Add Task',
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddToDoView()),
          );
        },
      ),
    ],
  );
}
