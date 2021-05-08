library calendar_data_timeline;

import 'package:calendar_data_timeline/models/date_data.dart';
import 'package:calendar_data_timeline/views/mobile.dart';
import 'package:calendar_data_timeline/views/web.dart';
import 'package:flutter/material.dart';
import 'package:calendar_data_timeline/models/export_all.dart';
export 'package:calendar_data_timeline/models/export_all.dart';

class CalendarDataTimeline extends StatefulWidget {
  /// This is the data source to displayed in the calendar.
  final List<CalendarContent> data;

  /// Separator for mobile view, default value is 'to'.
  final String mobileDateSeparator;

  ///List of Instance CalendarContent which will be used as the in body.
  final HeaderSettings settings;

  ///Instance of HeaderSettings.
  final BodySettings bodySettings;

  ///Instance of BodySettings.
  final Color? sundayColor;

  /// Color choice for sunday color, leave it null if you want to highlight sunday as well.
  CalendarDataTimeline(
      {required this.data,
      required this.settings,
      this.mobileDateSeparator = "to",
      required this.bodySettings,
      this.sundayColor});

  @override
  _CalendarDataTimelineState createState() => _CalendarDataTimelineState();
}

class _CalendarDataTimelineState extends State<CalendarDataTimeline> {
  late final WebView _webView = WebView(
    data: widget.data,
    settings: widget.settings,
    bodySettings: widget.bodySettings,
    sundayColor: widget.sundayColor,
  );
  late final MobileView _mobileView = MobileView(
    dateSeparator: widget.mobileDateSeparator,
    data: widget.data,
    settings: widget.settings,
    bodySettings: widget.bodySettings,
    sundayColor: widget.sundayColor,
  );

  @override
  Widget build(BuildContext context) {
    try {
      return Material(
        child: LayoutBuilder(
          builder: (context, constraint) => Container(
              width: constraint.maxWidth,
              height: constraint.maxHeight,
              child: StreamBuilder<CurrentDate>(
                stream: dateData.stream$,
                builder: (_, snapshot) => !snapshot.hasError && snapshot.hasData
                    ? Container(
                        width: double.infinity,
                        child: ((constraint.maxWidth - 150) /
                                    snapshot.data!.daysInMonth) <
                                30
                            ? _mobileView
                            : _webView,
                      )
                    : Container(),
              )),
        ),
      );
    } catch (e) {
      return Container();
    }
  }
}
