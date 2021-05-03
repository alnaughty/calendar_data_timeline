import 'package:calendar_data_timeline/constant.dart';
import 'package:flutter/material.dart';


//This contains calendar body settings to customize body color
class BodySettings {
  final Color titleBGColor; // to customize body color
  final Color backgroundColor;
  final Color sundayColor; //default value is grey

  final double? radius;
  BodySettings({this.titleBGColor = Colors.grey, this.backgroundColor = Colors.grey, this.sundayColor = Colors.grey, this.radius});
}