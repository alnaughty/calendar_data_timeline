import 'package:flutter/material.dart';

//This contains calendar body settings to customize body color
class BodySettings {
  final Color titleBGColor; // to customize body color
  final Color backgroundColor; //default value is grey
  final double? radius; //customize radius of body cells

  BodySettings(
      {this.titleBGColor = Colors.grey,
      this.backgroundColor = Colors.grey,
      this.radius});
}
