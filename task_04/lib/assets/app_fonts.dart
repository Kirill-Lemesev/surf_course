import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyle {
  //Colored text
  static const redStyle = TextStyle(
    color: AppColors.red,
  );
  static const whiteStyle = TextStyle(color: AppColors.white);

  static const grayLineThroughStyle = TextStyle(
    color: AppColors.lightGray,
    decoration: TextDecoration.lineThrough,
  );
  //10
  static const gray10Style = TextStyle(fontSize: 10, color: AppColors.gray);
  //12
  static const noColor12Style = TextStyle(fontSize: 12);

  static const boldBlack12Style =
      TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold);
  //16
  static const noColor16Style = TextStyle(fontSize: 16);

  static const boldBlack16Style =
      TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
  //18
  static const noColor18Style = TextStyle(fontSize: 18);

  static const boldBlack18Style =
      TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);
  //24
  static const boldBlack24Style =
      TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold);
}
