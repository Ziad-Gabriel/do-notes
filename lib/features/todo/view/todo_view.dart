import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Date'),
        Divider(),
        Expanded(
          child: ListView(
            children: [
              Text('To Do Item 1'),
              Text('To Do Item 2'),
              Text('To Do Item 3'),
              Text('To Do Item 4'),
              Text('To Do Item 5'),
              Text('To Do Item 6'),
              Text('To Do Item 7'),
              Text('To Do Item 8'),
              Text('To Do Item 9'),
              Text('To Do Item 10'),
              Text('To Do Item 11'),
              Text('To Do Item 12'),
              Text('To Do Item 13'),
            ],
          ),
        ),
      ],
    );
  }
}
