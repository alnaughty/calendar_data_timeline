import 'package:calendar_data_timeline/calendar_data_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_data_timeline/models/date_data.dart';
import 'package:calendar_data_timeline/models/header_settings.dart';
import 'package:calendar_data_timeline/widget/helper_widgets.dart';

class CalendarHeader extends StatelessWidget with WidgetHelpers {
  /// Instance of HeaderSettings
  final HeaderSettings settings;

  /// Color choice for sunday color, leave it null if you want to highlight sunday as well.
  final Color? sundayColor;

  CalendarHeader({required this.settings, this.sundayColor});

  @override
  Widget build(BuildContext context) {
    try {
      final Size size = MediaQuery.of(context).size;
      return Container(
        width: double.infinity,
        height: settings.cellHeight * 2,
        child: getLayout(
            leftChild: settings.label == null
                ? null
                : LeftChildData(
                    string: settings.label!,
                    height: settings.cellHeight * 2,
                    color: Colors.transparent),
            rightChild: Container(
                width: double.infinity,
                height: settings.cellHeight * 2,
                child: StreamBuilder<CurrentDate>(
                    stream: dateData.stream$,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && !snapshot.hasError) {
                        return ListView(
                          physics: ClampingScrollPhysics(),
                          // controller: controller,
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              snapshot.data!.daysInMonth,
                              (index) => Container(
                                    height: settings.cellHeight * 2,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: index == 0
                                                    ? Colors.white
                                                    : Colors.transparent),
                                            right: BorderSide(
                                                color: Colors.white))),
                                    width: ((size.width - 150) /
                                                snapshot.data!.daysInMonth) <
                                            30
                                        ? 30
                                        : ((size.width - 150) /
                                            snapshot.data!.daysInMonth),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            child: Container(
                                                color: sundayColor != null &&
                                                        DateFormat.EEEE().format(
                                                                DateTime(
                                                                    snapshot
                                                                        .data!
                                                                        .currentYear,
                                                                    snapshot
                                                                        .data!
                                                                        .currentMonth,
                                                                    index +
                                                                        1)) ==
                                                            "Sunday"
                                                    ? sundayColor!
                                                    : settings.topColor,
                                                width: double.infinity,
                                                child: Center(
                                                  child: headerText(
                                                      DateFormat.EEEE(settings.locale)
                                                              .format(DateTime(
                                                                  snapshot.data!
                                                                      .currentYear,
                                                                  snapshot.data!
                                                                      .currentMonth,
                                                                  index + 1))
                                                              .substring(
                                                                  0, 3)[0]
                                                              .toUpperCase() +
                                                          DateFormat.EEEE(settings.locale)
                                                              .format(DateTime(
                                                                  snapshot.data!
                                                                      .currentYear,
                                                                  snapshot.data!
                                                                      .currentMonth,
                                                                  index + 1))
                                                              .substring(0, 3)
                                                              .substring(1),
                                                      color: sundayColor != null && DateFormat.EEEE().format(DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth, index + 1)) == "Sunday"
                                                          ? sundayColor!
                                                          : settings.topColor),
                                                ))),
                                        Expanded(
                                            child: Container(
                                                color: sundayColor != null &&
                                                        DateFormat.EEEE().format(
                                                                DateTime(
                                                                    snapshot
                                                                        .data!
                                                                        .currentYear,
                                                                    snapshot
                                                                        .data!
                                                                        .currentMonth,
                                                                    index +
                                                                        1)) ==
                                                            "Sunday"
                                                    ? sundayColor!
                                                    : settings.bottomColor,
                                                width: double.infinity,
                                                child: Center(
                                                  child: headerText(
                                                      (index + 1).toString(),
                                                      color: sundayColor !=
                                                                  null &&
                                                              DateFormat.EEEE().format(DateTime(
                                                                      snapshot
                                                                          .data!
                                                                          .currentYear,
                                                                      snapshot
                                                                          .data!
                                                                          .currentMonth,
                                                                      index +
                                                                          1)) ==
                                                                  "Sunday"
                                                          ? sundayColor!
                                                          : settings
                                                              .bottomColor),
                                                )))
                                      ],
                                    ),
                                  )),
                        );
                      }
                      return Container();
                    }))),
      );
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
