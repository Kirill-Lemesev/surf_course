import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/presentation/screens/color_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';

class PaletteItem extends StatefulWidget {
  final String title;
  final String hexColor;

  const PaletteItem({super.key, required this.title, required this.hexColor});

  @override
  State<PaletteItem> createState() => _PaletteItemState();
}

class _PaletteItemState extends State<PaletteItem> {
  bool _isCopied = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ColorScreen(
                      title: widget.title,
                      hexColor: widget.hexColor,
                    )),
          );
        },
        onLongPress: () {
          Clipboard.setData(ClipboardData(text: widget.hexColor.substring(1))).then((_) {
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
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor(widget.hexColor)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.title, style: AppFonts.default10Style),
              ],
            ),
            (_isCopied)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.hexColor, style: AppFonts.default10Style),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(widget.hexColor, style: AppFonts.default10Style),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

/*const ,*/
