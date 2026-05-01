import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:do_note/core/widgets/buttons/floating_button.dart';
import 'package:do_note/core/widgets/app_bars/main_app_bar.dart';
import 'package:do_note/features/todo/view/todo_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: mainAppBar('ToDo', context, ref),
      body: ToDoView(),
      floatingActionButton: mainFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
