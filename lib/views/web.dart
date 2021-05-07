import 'package:calendar_data_timeline/models/export_all.dart';
import 'package:calendar_data_timeline/views/export_all.dart';
import 'package:flutter/material.dart';

class WebView extends StatefulWidget {
  ///List of Instance CalendarContent which will be used as the in body
  final List<CalendarContent> data;

  ///Instance of HeaderSettings
  final HeaderSettings settings;

  ///Instance of BodySettings
  final BodySettings bodySettings;

  /// Color choice for sunday color, leave it null if you want to highlight sunday as well.
  final Color? sundayColor;

  WebView(
      {required this.data,
      required this.settings,
      required this.bodySettings,
      this.sundayColor});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  /// Instance of Calendar control
  late final CalendarControl _controlCenter = new CalendarControl(
    locale: widget.settings.locale,
  );

  /// instance of calendar header
  late final CalendarHeader _header = new CalendarHeader(
    settings: widget.settings,
    sundayColor: widget.sundayColor,
  );

  /// instance of calendar body
  late final CalendarBody _body = new CalendarBody(
    bodySettings: widget.bodySettings,
    data: widget.data,
    sundayColor: widget.sundayColor,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Control
          _controlCenter,

          ///Calendar header
          _header,

          ///Calendar Body
          Expanded(child: _body)
        ],
      ),
    );
  }
}
