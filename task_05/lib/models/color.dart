class ColorItem {
  final String name;
  final String? value;

  ColorItem(this.name, this.value);

  factory ColorItem.fromJson(Map<String, dynamic> json) {
    if (json case {'name': final name, 'value': final value}) {
      return ColorItem(name, value);
    } else if (json case {'name': final name}) {
      return ColorItem(name, null);
    } else {
      throw const FormatException('Unexpected JSON format');
    }
  }
}
