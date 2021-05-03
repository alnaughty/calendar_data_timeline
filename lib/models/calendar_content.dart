import 'package:calendar_data_timeline/models/date_from_to_model.dart';

//This is the content model of the calendar data item which will be viewed.
class CalendarContent {
  final String name; //This is the item name
  final List<DateFromTo> dates; //This contains the list of dates of each item
  CalendarContent({required this.name, required this.dates});
}
