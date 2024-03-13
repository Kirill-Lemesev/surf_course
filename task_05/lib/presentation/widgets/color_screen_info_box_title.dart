import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:flutter/material.dart';

class ColorScreenInfoBoxTitle extends StatelessWidget {
  final String title;

  const ColorScreenInfoBoxTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        title,
        style: AppFonts.bold30Style,
      ),
    );
  }
}
