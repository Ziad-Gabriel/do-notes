import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  final bool isSingUp;

  const AppName({super.key, required this.isSingUp});

  @override
  Widget build(BuildContext context) {
    double containerHeight = isSingUp ? 0.30 : 0.25;
    return Hero(
      tag: 'App name',
      child: Container(
        height: MediaQuery.of(context).size.height * containerHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadiusDirectional.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 100,
            child: Text(
              'Do Note',
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 52),
            ),
          ),
        ),
      ),
    );
  }
}
