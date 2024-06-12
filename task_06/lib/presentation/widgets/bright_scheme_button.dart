import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/themes/extensions/theme_button_background.dart';
import 'package:surf_flutter_courses_template/domain/theme.dart';


class BrightSchemeButton extends StatefulWidget {
  final int buttonId;
  final int schemeId;
  final Image schemeImage;
  final String buttonText;

  const BrightSchemeButton({
    super.key,
    required this.buttonId,
    required this.schemeId,
    required this.schemeImage,
    required this.buttonText,
  });

  @override
  State<BrightSchemeButton> createState() => _BrightSchemeButtonState();
}

class _BrightSchemeButtonState extends State<BrightSchemeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).extension<ThemeButtonBackground>()?.backgroundColor),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
            side: WidgetStatePropertyAll(BorderSide(
              width: 1.0,
              color: (widget.buttonId == widget.schemeId)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
            ))),
        onPressed: () {
          context.read<AppTheme>().setBrightThemeScheme(widget.buttonId);
          setState(() {});
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                widget.schemeImage,
                const SizedBox(
                  height: 5,
                ),
                Text(widget.buttonText,
                    style: (widget.buttonId == widget.schemeId)
                        ? Theme.of(context).textTheme.bodyMedium
                        : Theme.of(context).textTheme.labelMedium)
              ],
            ),
          ),
        ));
  }
}
