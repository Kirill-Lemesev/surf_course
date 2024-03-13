import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

class RGBButton extends StatelessWidget {
  final String title;
  final int color;

  const RGBButton({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              maximumSize: const Size(103, 56),
              backgroundColor: AppColors.white),
          onPressed: () {},
          child: Row(
            children: [
              Text(title, style: AppFonts.default16Style),
              const Expanded(
                  child: SizedBox(
                height: 10,
              )),
              Text('$color', style: AppFonts.default16Style),
            ],
          )),
    );
  }
}
