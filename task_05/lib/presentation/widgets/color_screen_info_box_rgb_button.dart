import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:flutter/services.dart';

class RGBButton extends StatefulWidget {
  final String title;
  final int color;

  const RGBButton({super.key, required this.title, required this.color});

  @override
  State<RGBButton> createState() => _RGBButtonState();
}

class _RGBButtonState extends State<RGBButton> {
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
              maximumSize: const Size(110, 56),
              backgroundColor: AppColors.white),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: widget.color.toString()))
                .then((_) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                width: 150,
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('${widget.title} скопирован')),
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
                    Text(widget.title, style: AppFonts.default16Style),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Text('${widget.color}', style: AppFonts.default16Style),
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
                    Text(widget.title, style: AppFonts.default16Style),
                    const Expanded(
                        child: SizedBox(
                      height: 10,
                    )),
                    Text('${widget.color}', style: AppFonts.default16Style),
                  ],
                )),
    );
  }
}
