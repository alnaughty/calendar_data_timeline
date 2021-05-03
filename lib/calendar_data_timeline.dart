library calendar_data_timeline;

import 'package:flutter/material.dart';
import 'package:calendar_data_timeline/views/export_all.dart';
import 'package:calendar_data_timeline/models/export_all.dart';
export 'package:calendar_data_timeline/models/export_all.dart';

class CalendarDataTimeline extends StatefulWidget {
  final List<CalendarContent> data;
  final HeaderSettings settings;
  final BodySettings bodySettings;

  CalendarDataTimeline(
      {required this.data, required this.settings, required this.bodySettings});

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
                ),
                Expanded(
                  child: CalendarBody(
                    bodySettings: widget.bodySettings,
                    data: widget.data,
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
