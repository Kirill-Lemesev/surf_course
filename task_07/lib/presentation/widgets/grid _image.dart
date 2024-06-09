import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/presentation/screens/scroll_screen.dart';

class GridItem extends StatelessWidget {
  final int imageID;
  final int imagesCount;
  final String image;
  final List imagesList;

  const GridItem(
      {super.key,
      required this.image,
      required this.imageID,
      required this.imagesCount,
      required this.imagesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScrollScreen(
                        imageID: imageID,
                        imagesCount: imagesCount,
                        imagesList: imagesList,
                      )));
        },
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
