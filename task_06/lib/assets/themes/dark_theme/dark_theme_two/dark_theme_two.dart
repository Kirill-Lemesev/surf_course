import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/themes/extensions/theme_button_background.dart';

ThemeData darkThemeTwo = ThemeData(
  primaryColorDark: AppColors.blue,
  extensions: [ThemeButtonBackground(backgroundColor: AppColors.ocean)],
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.white,
      onSecondary: AppColors.white,
      surface: AppColors.soulful,
      onSurface: AppColors.grayBlue,
      error: AppColors.white,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.midnightExpress,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.midnightExpress,
        elevation: 0,
        iconTheme: IconThemeData(size: 24, color: AppColors.blue),
        titleTextStyle: AppFons.titleLargeWhite,
        toolbarTextStyle: AppFons.toolBarTwo),
    iconTheme: IconThemeData(size: 24, color: AppColors.blue),
    listTileTheme: ListTileThemeData(titleTextStyle: AppFons.white16),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.soulful,
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
      labelMedium: AppFons.labelMediumTwo,
      bodyMedium: AppFons.bodyMediumWhite,
      titleLarge: AppFons.titleLargeWhite,
    ));
