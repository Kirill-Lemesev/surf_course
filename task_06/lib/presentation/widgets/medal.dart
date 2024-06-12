import 'package:flutter/material.dart';

class Medal extends StatelessWidget {
  final String medal;
  const Medal({super.key, required this.medal});

  @override
  Widget build(BuildContext context) {
    return Text(
        medal,
        style: Theme.of(context).textTheme.headlineLarge
    );
  }
}
