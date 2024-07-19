import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/medal.dart';

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
          Medal(medal: AppStrings.goldMedal),
          const SizedBox(
            width: 10,
          ),
          Medal(medal: AppStrings.goldMedal),
          const SizedBox(
            width: 10,
          ),
          Medal(medal: AppStrings.bronzeMedal),
          const SizedBox(
            width: 10,
          ),
          Medal(medal: AppStrings.silverMedal),
          const SizedBox(
            width: 10,
          ),
          Medal(medal: AppStrings.bronzeMedal),
          const Expanded(
              child: SizedBox(
            height: 10,
          )),
        ],
      ),
    );
  }
}
