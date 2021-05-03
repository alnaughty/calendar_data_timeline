import 'package:flutter/material.dart';
class DateFromTo{
  final DateTime from; // this is the starting date of the range
  final DateTime to; // this is the end date of the range
  final Color color; // customize color
  DateFromTo({required this.from, required this.to, required this.color});
}