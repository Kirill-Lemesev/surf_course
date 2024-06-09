import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ScrollImage extends StatelessWidget {
  final bool blur;
  final String url;

  const ScrollImage({super.key,
    required this.url,
    required this.blur});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Stack(children: [
        BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: (blur) ? 5 : 0,
            sigmaY: (blur) ? 5 : 0,
          ),
          child: Container(
              clipBehavior: Clip.antiAlias,
              height: double.infinity,
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Image.network(
                url,
                fit: BoxFit.fitHeight,
              )),
        )
      ]),
    );
  }
}
