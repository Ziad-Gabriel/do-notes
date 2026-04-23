import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 1'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 2'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 3'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 4'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 5'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 6'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 7'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 8'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 9'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Text('Note 10'),
          ),
        ),
      ],
    );
  }
}
