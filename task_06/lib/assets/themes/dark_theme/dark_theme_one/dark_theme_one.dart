import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/themes/extensions/theme_button_background.dart';

ThemeData darkThemeOne = ThemeData(
  primaryColorDark: AppColors.green,
  extensions: [ThemeButtonBackground(backgroundColor: AppColors.chromeBlack)],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.green,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      surface: AppColors.raisinBlack,
      onSurface: AppColors.sonicSilver,
      error: AppColors.white,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        iconTheme: IconThemeData(size: 24, color: AppColors.green),
        titleTextStyle: AppFons.titleLargeBlack,
        toolbarTextStyle: AppFons.toolBarOne),
    iconTheme: IconThemeData(size: 24, color: AppColors.green),
    listTileTheme: ListTileThemeData(titleTextStyle: AppFons.white16),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.raisinBlack,
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
      bodyMedium: AppFons.bodyMediumWhite,
      titleLarge: AppFons.titleLargeWhite,
    ));
