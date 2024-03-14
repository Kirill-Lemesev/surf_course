import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/screens/color_palette_screen.dart';
import 'package:surf_flutter_courses_template/models/colors.dart';

void main() => runApp(const ColorPaletteApp());

class ColorPaletteApp extends StatelessWidget {
  const ColorPaletteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
        home: ColorPaletteScreen(colorsList: ColorItemsList()));
  }
}
