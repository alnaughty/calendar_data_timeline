import 'package:flutter/material.dart';

class HeaderSettings {
  final Color topColor; //Customize header days background color
  final Color bottomColor; //Customize header days (int) backgroundColor
  final String locale; //specify locale (e.g 'en_US')
  final String? label; // Label is for the body text data (e.g. Employees)

  HeaderSettings(
      {this.bottomColor = Colors.grey,
      this.topColor = Colors.blue,
      this.locale = 'en_US',
      this.label});
}
