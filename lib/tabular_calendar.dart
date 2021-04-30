library tabular_calendar;
import 'package:flutter/material.dart';
import 'package:tabular_calendar/views/export_all.dart';
import 'package:tabular_calendar/models/export_all.dart';
export 'package:tabular_calendar/models/export_all.dart';

class TabularCalendar extends StatefulWidget {
  final List<TabularModel> data;
  final HeaderSettings settings;
  TabularCalendar({required this.data,required this.settings});
  @override
  _TabularCalendarState createState() => _TabularCalendarState();
}

class _TabularCalendarState extends State<TabularCalendar> {
  @override
  Widget build(BuildContext context) {
    return Material(

      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          width: constraint.maxWidth,
          height: constraint.maxHeight,
          child: Column(
            children: [
              CalendarControl(locale: widget.settings.locale,),
              CalendarHeader(itemLabel: widget.settings.label,settings: widget.settings,),
              Expanded(
                child: CalendarBody(
                  data: widget.data,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
