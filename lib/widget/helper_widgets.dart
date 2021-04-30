import 'package:flutter/material.dart';

class WidgetHelpers {
  Text headerText(String text, {Color color = Colors.black54}) => Text(text, style: TextStyle(
    color: color,
    fontSize: 12
  ),textAlign: TextAlign.center,);

  Color calculateTextColor(Color color) {
    return color.computeLuminance() >= 0.5 ? Colors.black54 : Colors.white;
  }
}