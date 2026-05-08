import 'package:flutter/material.dart';

import 'package:do_note/features/add_to_do/view/add_to_do_view.dart';

Widget mainFloatingActionButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddToDoView()),
    ),
    child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(
        Icons.add_outlined,
        color: Theme.of(context).colorScheme.onPrimary,
        size: 26,
      ),
    ),
  );
}
