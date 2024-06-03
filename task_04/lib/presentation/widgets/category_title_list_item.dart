import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

class CategoryTitleItem extends StatelessWidget {
  final String title;

  const CategoryTitleItem(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Text(title, style: AppTextStyle.boldBlack16Style)],
      ),
    );
  }
}
