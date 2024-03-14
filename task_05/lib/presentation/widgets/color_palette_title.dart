import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:flutter/material.dart';

class ColorPaletteTitle extends StatelessWidget {
  const ColorPaletteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.header,
      style: AppFonts.bold30Style,
    );
  }
}
