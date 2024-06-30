import 'dart:ui';

import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyles {
  static const TextStyle hint = TextStyle(color: AppColors.grey, fontSize: 16, decoration: TextDecoration.none);
  static const TextStyle successText = TextStyle(color: AppColors.white, fontSize: 56);
  static const TextStyle errorText = TextStyle(color: AppColors.red, fontSize: 56);
}