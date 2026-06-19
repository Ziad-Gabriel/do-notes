import 'package:do_note/features/auth/shared_widget/app_name/app_name.dart';
import 'package:do_note/features/auth/shared_widget/button/convert_button.dart';
import 'package:do_note/features/auth/shared_widget/text_fields/password_text_field.dart';
import 'package:do_note/features/auth/sing_in/widgets/button/sing_in_button.dart';
import 'package:do_note/features/auth/sing_in/widgets/text_field/confirm_password_text_field.dart';
import 'package:do_note/features/auth/shared_widget/text_fields/user_name_text_field.dart';
import 'package:do_note/features/auth/sing_up/view/sing_up_view.dart';
import 'package:flutter/material.dart';

class SingInView extends StatefulWidget {
  const SingInView({super.key});

  @override
  State<SingInView> createState() => _SingInViewState();
}

class _SingInViewState extends State<SingInView> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  static const Widget gab = SizedBox(height: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppName(isSingUp: false),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(
                children: [
                  UserNameTextField(controller: userNameController),
                  gab,
                  PasswordTextField(controller: passwordController),
                  gab,
                  ConfirmPasswordTextField(controller: confirmController),
                  gab,
                  const SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SingInButton(),
                        ConvertButton(
                          title: 'Sing Up',
                          navigateTo: SingUpView(),
                          isSingUp: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
