import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:flutter/services.dart';

class HexButton extends StatefulWidget {
  final String hexColor;

  const HexButton({super.key, required this.hexColor});

  @override
  State<HexButton> createState() => _HexButtonState();
}

class _HexButtonState extends State<HexButton> {
  bool _isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.white),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: widget.hexColor.substring(1)))
                .then((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                width: 150,
                content: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: Text('Hex скопирован')),
                ),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: const EdgeInsets.all(10),
              ));
            }).then((_) {
              setState(() {
                _isCopied = !_isCopied;
              });
            });
          },
          child: (_isCopied)
              ? Row(
                  children: [
                    Text(AppStrings.hex, style: AppFonts.default16Style),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Text(widget.hexColor.substring(1),
                        style: AppFonts.default16Style),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.copy_outlined,
                      color: AppColors.grey,
                      size: 10.0,
                    )
                  ],
                )
              : Row(
                  children: [
                    Text(AppStrings.hex, style: AppFonts.default16Style),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Text(widget.hexColor.substring(1),
                        style: AppFonts.default16Style)
                  ],
                )),
    );
  }
}
