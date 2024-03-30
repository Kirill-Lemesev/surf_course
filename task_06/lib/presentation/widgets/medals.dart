import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class MedalRow extends StatelessWidget {
  const MedalRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
          Text(
            AppStrings.goldMedal,
            style: AppFonts.noStyle32,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppStrings.goldMedal,
            style: AppFonts.noStyle32,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppStrings.bronzeMedal,
            style: AppFonts.noStyle32,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppStrings.silverMedal,
            style: AppFonts.noStyle32,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            AppStrings.bronzeMedal,
            style: AppFonts.noStyle32,
          ),
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
        ],
      ),
    );
  }
}
