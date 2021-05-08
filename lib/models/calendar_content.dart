import 'package:calendar_data_timeline/models/date_from_to_model.dart';
import 'package:flutter/material.dart';

///This is the content model of the calendar data item which will be viewed.
class CalendarContent {
  /// Content Scroll Controller
  final String name;

  ///This is the item name
  List<DateFromTo> dates;

  ///This contains the list of dates of each item
  CalendarContent({required this.name, required this.dates});
}

class LeftChildData {
  final Color color;

  /// Left child data background color
  final String string;

  ///Left child data display string
  final double height;

  /// left child data height

  LeftChildData(
      {this.color = Colors.transparent,
      required this.string,
      required this.height});
}
