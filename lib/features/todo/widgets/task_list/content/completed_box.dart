import 'package:flutter/material.dart';

class CompletedBox extends StatelessWidget {
  final bool isCompleted;
  const CompletedBox({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        children: [
          Divider(
            thickness: 2,
            //  color: const Color.fromARGB(255, 54, 54, 54)
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              color: Colors.transparent,
            ),

            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                isCompleted == true ? 'Completed' : 'Not Completed',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
