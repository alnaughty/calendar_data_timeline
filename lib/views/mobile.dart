import 'package:calendar_data_timeline/constant.dart';
import 'package:calendar_data_timeline/models/export_all.dart';
import 'package:calendar_data_timeline/widget/helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MobileView extends StatefulWidget {
  ///List of Instance CalendarContent which will be used as the in body
  final List<CalendarContent> data;

  ///Instance of HeaderSettings
  final HeaderSettings settings;

  ///Instance of BodySettings
  final BodySettings bodySettings;

  /// Color choice for sunday color, leave it null if you want to highlight sunday as well.
  final Color? sundayColor;

  MobileView(
      {required this.data,
      required this.settings,
      required this.bodySettings,
      this.sundayColor});

  @override
  _MobileViewState createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with WidgetHelpers {
  late List<DateFromTo> _dates = dateDataa;
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;
  late int numOfDays = daysCounter;
  double pos = 0.0;
  int noOfWeeks = 5;
  List<List<int?>> _weeks_ = [];
  List _week = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  List<DateFromTo> get dateDataa {
    List<DateFromTo> _lst = [];
    for (CalendarContent content in widget.data) {
      _lst += content.dates;
    }
    return _lst;
  }

  int get daysCounter => DateTime(currentYear, currentMonth + 1, 01)
      .difference(DateTime(currentYear, currentMonth, 01))
      .inDays;
  late List<int> days;

  populator() {
    setState(() {
      _weeks_.clear();
      days = List.generate(daysCounter, (index) => index + 1);
      for (var x = 0; x < 6; x++) {
        List<int?> _toAdd = [];
        for (var i = 0; i < 7; i++) {
          if (x == 0) {
            if (DateTime(currentYear, currentMonth, days[0]).weekday == i) {
              // _toAdd[i] = days[0];
              _toAdd.add(days[0]);
              days.removeAt(0);
            } else {
              // _toAdd[i+1] = null;
              _toAdd.add(null);
            }
          } else {
            if (_toAdd.length < 7 && days.length > 0) {
              _toAdd.add(days[0]);
              days.removeAt(0);
            } else {
              _toAdd.add(null);
            }
          }
        }

        if (!listValuesAreNull(_toAdd)) {
          _weeks_.add(_toAdd);
        }
      }
    });
  }

  bool listValuesAreNull(List<int?> _list) {
    for (int? item in _list) {
      if (item != null) {
        return false;
      }
    }
    return true;
  }

  @override
  void initState() {
    populator();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.chevron_left,
                      size: 35,
                    ),
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        if (currentMonth > 1) {
                          currentMonth--;
                        } else {
                          currentYear--;
                          currentMonth = 12;
                        }
                      });
                      populator();
                    }),
                Text(DateFormat.yMMM('${widget.settings.locale}')
                    .format(DateTime(currentYear, currentMonth, 01))),
                IconButton(
                    icon: Icon(
                      Icons.chevron_right,
                      size: 35,
                    ),
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      setState(() {
                        if (currentMonth < 12) {
                          currentMonth++;
                        } else {
                          currentYear++;
                          currentMonth = 1;
                        }
                      });
                      populator();
                    }),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                for (String day in _week) ...{
                  Expanded(
                    child: Container(
                      color: widget.settings.topColor,
                      child: Center(
                        child:
                            bodyTitleText(day, color: widget.settings.topColor),
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
          for (var data in _weeks_) ...{
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                children: [
                  for (int? d in data) ...{
                    Expanded(
                      child: Container(
                          color: d == null
                              ? Colors.grey.shade300
                              : Colors.transparent,
                          child: Stack(children: [
                            for (DateFromTo _date in _dates) ...{
                              Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: data.indexOf(d) == 0 &&
                                          widget.sundayColor != null
                                      ? BorderRadius.circular(0)
                                      : BorderRadius.horizontal(
                                          left: isSameDate(
                                                  _date.from,
                                                  DateTime(currentYear,
                                                      currentMonth, d ?? 0))
                                              ? Radius.circular(widget
                                                          .bodySettings
                                                          .radius ==
                                                      null
                                                  ? size.width > 900
                                                      ? size.width /
                                                          (daysCounter *
                                                              percentage)
                                                      : 40
                                                  : widget.bodySettings.radius!)
                                              : Radius.circular(0),
                                          right: isSameDate(
                                                  _date.to,
                                                  DateTime(currentYear,
                                                      currentMonth, d ?? 0))
                                              ? Radius.circular(
                                                  widget.bodySettings.radius == null
                                                      ? size.width > 900
                                                          ? size.width / (daysCounter * percentage)
                                                          : 40
                                                      : widget.bodySettings.radius!)
                                              : Radius.circular(0)),
                                  color: inRange(
                                              _date.from,
                                              _date.to,
                                              DateTime(currentYear,
                                                  currentMonth, d ?? 0)) ||
                                          (isSameDate(
                                                  _date.from,
                                                  DateTime(currentYear,
                                                      currentMonth, d ?? 0)) ||
                                              isSameDate(
                                                  _date.to,
                                                  DateTime(currentYear,
                                                      currentMonth, d ?? 0)))
                                      ? _date.color.withOpacity(0.5)
                                      : Colors.transparent,
                                ),
                              )
                            },
                            Container(
                              width: double.infinity,
                              height: 60,
                              color: d == null
                                  ? Colors.grey.shade300
                                  : data.indexOf(d) == 0 &&
                                          widget.sundayColor != null
                                      ? widget.sundayColor
                                      : Colors.transparent,
                              child: Center(
                                child: headerText("${d ?? ""}",
                                    color: data.indexOf(d) == 0 &&
                                            widget.sundayColor != null
                                        ? widget.sundayColor!
                                        : Colors.white),
                              ),
                            )
                          ])),
                    )
                  }
                ],
              ),
            )
          },
          if (widget.settings.label != null) ...{
            Container(
              width: double.infinity,
              color: widget.settings.topColor,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: bodyTitleText(widget.settings.label!,
                  color: widget.settings.topColor),
            )
          }
        ],
      ),
    );
  }
}
