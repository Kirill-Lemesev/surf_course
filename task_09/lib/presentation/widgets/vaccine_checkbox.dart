import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';

class VaccineCheckbox extends StatelessWidget {
  final bool isActive;
  final String label;
  final Function onChanged;
  final bool state;

  const VaccineCheckbox(this.isActive, this.label, this.onChanged,
      {super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!state) {
          onChanged();
        }
      },
      child: Row(
        children: [
          Opacity(
            opacity: (state) ? 0.5 : 1,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: (isActive) ? AppColors.pink : AppColors.white,
              ),
              child: Icon(Icons.check,
                  color: (isActive) ? AppColors.white : Colors.transparent),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(label, style: AppFonts.blueTextSize16)
        ],
      ),
    );
  }
}
