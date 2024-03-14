class ColorItem {
  final String name;
  final String? hexColor;

  ColorItem(this.name, this.hexColor);

  factory ColorItem.fromJson(Map<String, dynamic> json) {
    if (json case {'name': final name, 'value': final hexColor}) {
      return ColorItem(name, hexColor);
    } else if (json case {'name': final name}) {
      return ColorItem(name, null);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}
