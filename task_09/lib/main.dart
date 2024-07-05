import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/form.dart';

void main() => MainApp();

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PetForm(),
    );
  }
}
