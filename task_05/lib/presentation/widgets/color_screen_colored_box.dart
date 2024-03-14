import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ColorScreenColoredBox extends StatelessWidget {
  final String hexColor;

  const ColorScreenColoredBox({super.key, required this.hexColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          decoration: BoxDecoration(
        color: HexColor(hexColor),
      )),
    );
  }
}
