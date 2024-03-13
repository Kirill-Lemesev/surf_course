import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

class PaletteItem extends StatelessWidget {
  final String name;
  final String hexColor;
  const PaletteItem({super.key, required this.name, required this.hexColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          print('Tap');
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
                    color: Color(
                        int.parse(hexColor.substring(1, 7), radix: 16) +
                            0xFF000000)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name, style: AppFonts.default10Style),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(hexColor, style: AppFonts.default10Style),
                const SizedBox(width: 5,),
                const Icon(
                  Icons.copy,
                  color: AppColors.grey,
                  size: 10,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*const ,*/
