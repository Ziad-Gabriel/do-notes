import 'package:flutter/material.dart';

class TaskNavButton extends StatelessWidget {
  final int currentIndex;
  final int selectIndex;

  const TaskNavButton({
    super.key,
    required this.currentIndex,
    required this.selectIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: currentIndex == selectIndex
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        width: currentIndex == selectIndex ? 100 : 60,
        child: Center(
          child: Icon(
            selectIndex == 0
                ? Icons.check_circle_outline_rounded
                : Icons.check_circle,
          ),
        ),
      ),
    );
  }
}
