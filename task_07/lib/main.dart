import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  static const _rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.cyan,
    Colors.blue,
    Colors.purple,
  ];
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          children: _rainbowColors.map((e) => _PageViewItem(color: e)).toList(),
        ),
      ),
    );
  }
}

class _PageViewItem extends StatelessWidget {
  final Color color;
  const _PageViewItem({
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(child: ColoredBox(color: color));
  }
}