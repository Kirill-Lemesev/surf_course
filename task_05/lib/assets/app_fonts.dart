import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

abstract class AppFonts {
  static const bold30Style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: AppColors.black,
    decoration: TextDecoration.none,
  );

  static const default10Style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 10,
    color: AppColors.black,
    decoration: TextDecoration.none,
  );
}
