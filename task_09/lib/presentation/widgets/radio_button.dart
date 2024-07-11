import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/animal_types.dart';

class PetRadioButton extends StatelessWidget {
  final String image;
  final String buttonName;
  final Animal value;
  final Animal groupValue;
  final bool state;
  final ValueChanged<Animal> onChanged;

  const PetRadioButton(
      {super.key,
      required this.image,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.buttonName,
      required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!state) {
          onChanged(value);
        }
      },
      child: Opacity(
        opacity: (state) ? 0.5 : 1.0,
        child: Column(
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  color:
                      (value == groupValue) ? AppColors.pink : AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: ImageIcon(
                size: 32,
                AssetImage(image),
                color:
                    (value == groupValue) ? AppColors.white : AppColors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(buttonName, style: AppFonts.blackTextSize12)
          ],
        ),
      ),
    );
  }
}
