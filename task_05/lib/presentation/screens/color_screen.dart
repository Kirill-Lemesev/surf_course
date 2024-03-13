import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_screen_colored_box.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_screen_info_box.dart';

class ColorScreen extends StatelessWidget {
  final String title;
  final String hexColor;

  const ColorScreen({super.key, required this.hexColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: HexColor(hexColor)),
      body: Column(
        children: [
          ColorScreenColoredBox(hexColor: hexColor),
          ColorScreenInfoBox(title: title, hexColor: hexColor)
        ],
      ),
    );
  }
}
