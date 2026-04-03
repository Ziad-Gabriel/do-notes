import 'package:flutter/material.dart';

class MainAppNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const MainAppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      // notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.list)),
          SizedBox(width: 40),
          IconButton(onPressed: () {}, icon: Icon(Icons.sticky_note_2_rounded)),
        ],
      ),
    );
  }
}
