import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_screen_info_box_title.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_screen_info_box_hex_button.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_screen_info_box_rgb_button.dart';

class ColorScreenInfoBox extends StatelessWidget {
  final String title;
  final String hexColor;

  const ColorScreenInfoBox(
      {super.key, required this.hexColor, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: const BoxDecoration(color: AppColors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              ColorScreenInfoBoxTitle(
                title: title,
              ),
              HexButton(
                hexColor: hexColor,
              ),
              Row(children: [
                RGBButton(
                  title: AppStrings.red,
                  color: HexColor(hexColor).red,
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                RGBButton(
                  title: AppStrings.green,
                  color: HexColor(hexColor).green,
                ),
                const Expanded(
                    child: SizedBox(
                  height: 10,
                )),
                RGBButton(
                  title: AppStrings.blue,
                  color: HexColor(hexColor).blue,
                )
              ]),
            ],
          ),
        ));
  }
}
