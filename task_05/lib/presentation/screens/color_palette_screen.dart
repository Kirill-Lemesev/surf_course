import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';
import 'package:surf_flutter_courses_template/models/colors.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/color_palette_title.dart';
import 'package:surf_flutter_courses_template/presentation/widgets/palette_item.dart';
import 'package:surf_flutter_courses_template/models/color.dart';

class ColorPaletteScreen extends StatefulWidget {
  final ColorItemsList colorsList;
  const ColorPaletteScreen({super.key, required this.colorsList});

  @override
  State<ColorPaletteScreen> createState() => _ColorPaletteScreenState();
}

class _ColorPaletteScreenState extends State<ColorPaletteScreen> {
  late Future<List<PaletteItem>> _colorsList;

  Future<List<PaletteItem>> fetchPaletteItems(List<ColorItem> colorItemsList) {
    final List<PaletteItem> paletteItems = [];
    for (var i in colorItemsList) {
      if (i.hexColor != null) {
        paletteItems.add(PaletteItem(title: i.name, hexColor: i.hexColor!));
      }
    }
    return Future.delayed(const Duration(seconds: 3), () => paletteItems);
  }

  @override
  void initState() {
    _colorsList = fetchPaletteItems(widget.colorsList.getColorItemsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.white,
      child: FutureBuilder(
          future: _colorsList,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    const SafeArea(child: SizedBox(height: 30)),
                    const ColorPaletteTitle(),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        children: snapshot.requireData,
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
