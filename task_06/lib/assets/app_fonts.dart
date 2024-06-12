import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

abstract class AppFons {
  static TextStyle labelSmall =  TextStyle(fontSize: 12, color: AppColors.white);
  static TextStyle titleLargeBlack = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black);
  static TextStyle titleLargeWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.white);
  static TextStyle black16 =  TextStyle(fontSize: 16, color: AppColors.black);
  static TextStyle white16 =  TextStyle(fontSize: 16, color: AppColors.white);
  static TextStyle noStyle16 =  const TextStyle(fontSize: 16);
  static TextStyle bodyMediumBlack =  TextStyle(fontSize: 14, color: AppColors.black);
  static TextStyle bodyMediumWhite =  TextStyle(fontSize: 14, color: AppColors.white);
  static TextStyle toolBarOne = TextStyle(fontSize: 14, color: AppColors.green);
  static TextStyle toolBarTwo = TextStyle(fontSize: 14, color: AppColors.blue);
  static TextStyle toolBarThree = TextStyle(fontSize: 14, color: AppColors.orange);
  static TextStyle labelMediumOne = TextStyle(fontSize: 14, color: AppColors.sonicSilver);
  static TextStyle labelMediumTwo = TextStyle(fontSize: 14, color: AppColors.grayBlue);
  static TextStyle labelMediumThree = TextStyle(fontSize: 14, color: AppColors.grayOrange);
}