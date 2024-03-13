import 'dart:convert';

import 'package:surf_flutter_courses_template/models/color.dart';
import 'package:surf_flutter_courses_template/data/mock_data.dart';

class ColorItemsList {
  final Map<String, dynamic> _json;

  ColorItemsList() : _json = jsonDecode(colors);

  List<ColorItem> getColorItemsList() {
    if (_json case {'colors': List colorsJson}) {
      return [
        for (final colorJson in colorsJson) ColorItem.fromJson(colorJson)
      ];
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}
