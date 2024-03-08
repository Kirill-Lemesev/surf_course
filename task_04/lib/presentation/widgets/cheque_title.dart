import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';

class ChequeTitle extends StatelessWidget {
  const ChequeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            AppStrings.inYourPurchase,
            textAlign: TextAlign.start,
            style: AppTextStyle.boldBlack16Style,
          ),
        ],
      ),
    );
  }
}
