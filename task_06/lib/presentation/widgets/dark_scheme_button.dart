import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/assets/themes/extensions/theme_button_background.dart';
import 'package:surf_flutter_courses_template/domain/theme.dart';


class DarkSchemeButton extends StatefulWidget {
  final int buttonId;
  final int schemeId;
  final Image schemeImage;
  final String buttonText;

  const DarkSchemeButton({
    super.key,
    required this.buttonId,
    required this.schemeId,
    required this.schemeImage,
    required this.buttonText,
  });

  @override
  State<DarkSchemeButton> createState() => _DarkSchemeButtonState();
}

class _DarkSchemeButtonState extends State<DarkSchemeButton> {
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
                  ? Theme.of(context).primaryColorDark
                  : Colors.transparent,
            ))),
        onPressed: () {
          context.read<AppTheme>().setDarkThemeScheme(widget.buttonId);
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
