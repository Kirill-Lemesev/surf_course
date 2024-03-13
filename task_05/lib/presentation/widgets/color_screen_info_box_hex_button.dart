import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

class HexButton extends StatelessWidget {
  final String hexColor;

  const HexButton({super.key, required this.hexColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.white),
          onPressed: () {},
          child: Row(
            children: [
              Text(AppStrings.hex, style: AppFonts.default16Style),
              const Expanded(
                  child: SizedBox(
                height: 10,
              )),
              Text(hexColor.substring(1), style: AppFonts.default16Style)
            ],
          )),
    );
  }
}
