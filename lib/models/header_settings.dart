import 'package:flutter/material.dart';
class HeaderSettings {
  final Color topColor;
  final Color bottomColor;
  final String locale;
  final String? label;
  HeaderSettings({this.bottomColor = Colors.grey, this.topColor = Colors.blue, this.locale = 'en_US', this.label});
}