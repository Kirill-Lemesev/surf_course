import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/grid _image.dart';

import 'package:surf_flutter_courses_template/data/mock_data.dart';

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  late Future _imageList;

  @override
  void initState() {
    _imageList = fetchData(images);
    super.initState();
  }

  Future<List<GridItem>> fetchData(List items) {
    var imageID = 0;
    var imagesCount = items.length;
    final List<GridItem> imageList = [];
    for (var i in items) {
      imageID++;
      imageList.add(GridItem(
        image: i.url,
        imageID: imageID,
        imagesCount: imagesCount,
      ));
    }
    return Future.delayed(const Duration(seconds: 5), () => imageList);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _imageList,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.black,
            ));
          }
          if (snapshot.hasData) {
            return SafeArea(
              child: Container(
                color: AppColors.white,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Image(image: AssetImage('assets/logo.png')),
                    ),
                    Expanded(
                        child: GridView.count(
                      crossAxisCount: 3,
                      children: snapshot.requireData,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                    ))
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.black,
          ));
        });
  }
}
