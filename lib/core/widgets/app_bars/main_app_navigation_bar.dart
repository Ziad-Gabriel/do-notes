import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MainAppNavigationBar extends ConsumerWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const MainAppNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      clipBehavior: Clip.antiAlias,
      height: 80,
      notchMargin: 6.0,
      shape: CircularNotchedRectangle(),
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withAlpha(235),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(154, 106, 106, 106),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: selectedIndex == 0 ? 30 : 20,
                  width: selectedIndex == 0 ? 70 : 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.primary.withAlpha(
                      selectedIndex == 0 ? 230 : 0,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (selectedIndex != 0) {
                      onTap(0);
                    }
                  },
                  icon: Icon(Icons.check_circle_outline_rounded),
                ),
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: selectedIndex == 1 ? 30 : 20,
                  width: selectedIndex == 1 ? 70 : 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Theme.of(context).colorScheme.primary.withAlpha(
                      selectedIndex == 1 ? 230 : 0,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (selectedIndex != 1) {
                      onTap(1);
                    }
                  },
                  icon: Icon(Icons.check_circle_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
