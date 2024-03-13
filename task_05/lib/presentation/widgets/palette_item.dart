import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/presentation/screens/color_screen.dart';
import 'package:hexcolor/hexcolor.dart';

class PaletteItem extends StatelessWidget {
  final String title;
  final String hexColor;

  const PaletteItem({super.key, required this.title, required this.hexColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ColorScreen(
                      title: title,
                      hexColor: hexColor,
                    )),
          );
        },
        onLongPress: () {
          print('Press');
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor(hexColor)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.default10Style),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(hexColor, style: AppFonts.default10Style),
                const SizedBox(
                  width: 5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*const ,*/
