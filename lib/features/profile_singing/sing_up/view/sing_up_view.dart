import 'package:flutter/material.dart';

import 'package:do_note/features/profile_singing/shared_widget/text_fields/user_name_text_field.dart';
import 'package:do_note/features/profile_singing/shared_widget/app_name/app_name.dart';
import 'package:do_note/features/profile_singing/shared_widget/button/convert_button.dart';
import 'package:do_note/features/profile_singing/shared_widget/text_fields/password_text_field.dart';
import 'package:do_note/features/profile_singing/sing_in/view/sing_in_view.dart';
import 'package:do_note/features/profile_singing/sing_up/widgets/button/sing_up_button.dart';

class SingUpView extends StatefulWidget {
  const SingUpView({super.key});

  @override
  State<SingUpView> createState() => _SingUpViewState();
}

class _SingUpViewState extends State<SingUpView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  static const Widget gab = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppName(isSingUp: true),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserNameTextField(controller: emailController),
                    gab,
                    PasswordTextField(controller: passwordController),
                    gab,
                    const SingUpButton(),
                    const ConvertButton(
                      title: 'Sing In',
                      navigateTo: SingInView(),
                      isSingUp: true,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
