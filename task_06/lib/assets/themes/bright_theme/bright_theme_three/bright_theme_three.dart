import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/themes/extensions/theme_button_background.dart';

ThemeData brightThemeThree = ThemeData(
    extensions: [ThemeButtonBackground (backgroundColor: AppColors.lightOrange)],
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.orange,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.grayOrange,
      error: AppColors.white,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightOrange,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightOrange,
        elevation: 0,
        iconTheme: IconThemeData(size: 24, color: AppColors.orange),
        titleTextStyle: AppFons.titleLargeBlack,
        toolbarTextStyle: AppFons.toolBarThree),
    iconTheme: IconThemeData(size: 24, color: AppColors.orange),
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
          textStyle: AppFons.noStyle16,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    ),
    textTheme: TextTheme(
      labelSmall: AppFons.labelSmall,
      labelMedium: AppFons.labelMediumThree,
      bodyMedium: AppFons.bodyMediumBlack,
      titleLarge: AppFons.titleLargeBlack,
    ));