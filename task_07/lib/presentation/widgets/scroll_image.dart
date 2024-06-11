import 'package:flutter/material.dart';

class ScrollImage extends StatelessWidget {
  final String url;

  const ScrollImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
          clipBehavior: Clip.antiAlias,
          height: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.network(
            url,
            fit: BoxFit.fitHeight,
          )),
    );
  }
}
