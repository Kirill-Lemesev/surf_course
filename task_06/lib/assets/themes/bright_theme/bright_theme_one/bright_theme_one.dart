import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

ThemeData brightThemeOne = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.green,
      onPrimary: AppColors.white,
      secondary: AppColors.lotion,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.sonicSilver,
      error: AppColors.white,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(size: 24, color: AppColors.green),
        titleTextStyle: AppFons.titleLargeBlack,
        toolbarTextStyle: AppFons.toolBarOne),
    iconTheme: IconThemeData(size: 24, color: AppColors.green),
    listTileTheme: ListTileThemeData(titleTextStyle: AppFons.black16),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lotion,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.coralRed,
      textStyle: AppFons.noStyle16,
      side: BorderSide(
        width: 1.0,
        color: AppColors.coralRed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    )),
    filledButtonTheme: FilledButtonThemeData(

      style: FilledButton.styleFrom(
          backgroundColor: AppColors.violet,
          textStyle: AppFons.noStyle16,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    ),
    textTheme: TextTheme(
      labelSmall: AppFons.labelSmall,
      labelMedium: AppFons.labelMediumOne,
      bodyMedium: AppFons.bodyMediumBlack,
      titleLarge: AppFons.titleLargeBlack,
    ));
