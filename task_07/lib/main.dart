import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/screens/grid_screen.dart';

void main() {
  runApp(const PostogramApp());
}

class PostogramApp extends StatelessWidget {
  const PostogramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GridScreen(),
    );
  }
}
