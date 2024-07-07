import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/animal_types.dart';

class PetRadioButton extends StatelessWidget {
  final String image;
  final String buttonName;
  final Animal value;
  final Animal groupValue;
  final ValueChanged<Animal> onChanged;

  const PetRadioButton(
      {super.key,
      required this.image,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                color: (value == groupValue) ? AppColors.pink : AppColors.white,
                borderRadius: BorderRadius.circular(10)),
            child: ImageIcon(
              size: 32,
              AssetImage(image),
              color: (value == groupValue) ? AppColors.white : AppColors.black,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(buttonName, style: AppFonts.blackTextSize12)
        ],
      ),
    );
  }
}
