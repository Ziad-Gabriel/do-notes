import 'package:flutter/material.dart';

import 'package:do_note/core/widgets/buttons/main_button/main_button.dart';
import 'package:do_note/main_view.dart';

class SingInButton extends StatelessWidget {
  const SingInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainView()),
        );
      },
      title: 'Sing In',
    );
  }
}
