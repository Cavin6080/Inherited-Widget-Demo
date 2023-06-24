import 'package:flutter/material.dart';

class ColorWidget extends InheritedWidget {
  const ColorWidget({
    super.key,
    required super.child,
    required this.color,
    required this.onColorChange,
  });

  final Color color;
  final void Function() onColorChange;

  static ColorWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorWidget>();
  }

  @override
  bool updateShouldNotify(ColorWidget oldWidget) {
    return oldWidget.color != color;
  }
}
