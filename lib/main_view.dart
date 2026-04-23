import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:z_money/core/widgets/floating_button.dart';
import 'package:z_money/core/widgets/main_app_bar.dart';
import 'package:z_money/core/widgets/main_app_navigation_bar.dart';
import 'package:z_money/features/note/view/note_view.dart';
import 'package:z_money/features/todo/view/todo_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int _currentIndex = 0;

  final List<Widget> _views = [const ToDoView(), const NoteView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: mainAppBar(_currentIndex == 0 ? 'ToDo' : 'Note', context, ref),
      body: _views[_currentIndex],
      floatingActionButton: mainFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MainAppNavigationBar(
        selectedIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
