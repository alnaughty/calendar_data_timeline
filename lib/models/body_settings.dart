import 'package:flutter/material.dart';


//This contains calendar body settings to customize body color
class BodySettings {
  final Color titleBGColor; // to customize body color
  final Color backgroundColor;
  final Color sundayColor;//defaul value is grey
  BodySettings({this.titleBGColor = Colors.grey, this.backgroundColor = Colors.grey, this.sundayColor = Colors.grey});
}