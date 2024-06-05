import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final int imageID;
  final int imagesCount;
  final String image;

  const GridItem(
      {super.key,
      required this.image,
      required this.imageID,
      required this.imagesCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
