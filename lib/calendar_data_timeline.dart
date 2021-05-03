library calendar_data_timeline;

import 'package:flutter/material.dart';
import 'package:calendar_data_timeline/views/export_all.dart';
import 'package:calendar_data_timeline/models/export_all.dart';
export 'package:calendar_data_timeline/models/export_all.dart';

class CalendarDataTimeline extends StatefulWidget {
  final List<CalendarContent>
      data; //List of Instance CalendarContent which will be used as the in body
  final HeaderSettings settings; //Instance of HeaderSettings
  final BodySettings bodySettings; //Instance of BodySettings
  final Color?
      sundayColor; // Color choice for sunday color, leave it null if you want to highlight sunday as well.
  CalendarDataTimeline(
      {required this.data,
      required this.settings,
      required this.bodySettings,
      this.sundayColor});

  @override
  _CalendarDataTimelineState createState() => _CalendarDataTimelineState();
}

class _CalendarDataTimelineState extends State<CalendarDataTimeline> {
  @override
  Widget build(BuildContext context) {
    try {
      return Material(
        child: LayoutBuilder(
          builder: (context, constraint) => Container(
            width: constraint.maxWidth,
            height: constraint.maxHeight,
            child: Column(
              children: [
                CalendarControl(
                  locale: widget.settings.locale,
                ),
                CalendarHeader(
                  itemLabel: widget.settings.label,
                  settings: widget.settings,
                  sundayColor: widget.sundayColor,
                ),
                Expanded(
                  child: CalendarBody(
                    bodySettings: widget.bodySettings,
                    data: widget.data,
                    sundayColor: widget.sundayColor,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return Center(
        child: Text("Please wait..."),
      );
    }
  }
}
