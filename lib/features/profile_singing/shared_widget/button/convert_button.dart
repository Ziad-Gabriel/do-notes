import 'package:flutter/material.dart';

class ConvertButton extends StatelessWidget {
  final String title;
  final Widget navigateTo;
  final bool isSingUp;
  const ConvertButton({
    super.key,
    required this.title,
    required this.navigateTo,
    required this.isSingUp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isSingUp ? 'Not a member?' : 'I already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => navigateTo),
            );
          },
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodySmall!.copyWith(color: Colors.blue.shade900),
          ),
        ),
      ],
    );
  }
}
