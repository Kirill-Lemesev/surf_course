import 'package:flutter/material.dart';

class ThemeButtonBackground extends ThemeExtension<ThemeButtonBackground> {
  ThemeButtonBackground({required this.backgroundColor});

  final Color? backgroundColor;

  @override
  ThemeButtonBackground copyWith({Color? backgroundColor}) {
    return ThemeButtonBackground(
        backgroundColor: backgroundColor ?? this.backgroundColor);
  }

  @override
  ThemeButtonBackground lerp(ThemeButtonBackground? other, double t) {
    if (other is! ThemeButtonBackground) {
      return this;
    }
    return ThemeButtonBackground(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
    );
  }
}
