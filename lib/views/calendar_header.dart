import 'package:calendar_data_timeline/constant.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_data_timeline/models/date_data.dart';
import 'package:calendar_data_timeline/models/header_settings.dart';
import 'package:calendar_data_timeline/widget/helper_widgets.dart';

class CalendarHeader extends StatelessWidget with WidgetHelpers {
  final String? itemLabel;
  final HeaderSettings settings;

  CalendarHeader({this.itemLabel, required this.settings});

  @override
  Widget build(BuildContext context) {
    try {
      final Size size = MediaQuery.of(context).size;
      return Material(
          child: StreamBuilder<CurrentDate>(
              stream: dateData.stream$,
              builder: (context, snapshot) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black54, width: 1))),
                  child: Row(
                    children: [
                      Container(
                        color: itemLabel != null
                            ? settings.topColor
                            : settings.sundayColor,
                        width: size.width * .1,
                        height: 120,
                        alignment: AlignmentDirectional.center,
                        child: Padding(
                          padding: EdgeInsets.all((size.width * .1) * .1),
                          child: FittedBox(
                            child: bodyTitleText(itemLabel ?? "",
                                color: settings.topColor),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 60,
                              child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      snapshot.data!.daysInMonth,
                                      (index) => Container(
                                            decoration: BoxDecoration(
                                                color: DateFormat.EEEE().format(
                                                            DateTime(
                                                                snapshot.data!
                                                                    .currentYear,
                                                                snapshot.data!
                                                                    .currentMonth,
                                                                index + 1)) ==
                                                        "Sunday"
                                                    ? settings.sundayColor
                                                    : settings.topColor,
                                                border: Border(
                                                    right: BorderSide(
                                                        color: calculateTextColor(
                                                            settings
                                                                .topColor)))),
                                            width: size.width > 900
                                                ? size.width /
                                                    (snapshot
                                                            .data!.daysInMonth *
                                                        percentage)
                                                : 40,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: headerText(
                                                DateFormat.EEEE(settings.locale)
                                                        .format(DateTime(
                                                            snapshot.data!
                                                                .currentYear,
                                                            snapshot.data!
                                                                .currentMonth,
                                                            index + 1))
                                                        .substring(0, 3)[0]
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
                                                color: DateFormat.EEEE().format(
                                                            DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth, index + 1)) ==
                                                        "Sunday"
                                                    ? settings.sundayColor
                                                    : settings.topColor),
                                          ))),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(
                                      snapshot.data!.daysInMonth,
                                      (index) => Container(
                                            decoration: BoxDecoration(
                                                color: DateFormat.EEEE().format(
                                                            DateTime(
                                                                snapshot.data!
                                                                    .currentYear,
                                                                snapshot.data!
                                                                    .currentMonth,
                                                                index + 1)) ==
                                                        "Sunday"
                                                    ? settings.sundayColor
                                                    : settings.bottomColor,
                                                border: Border(
                                                    right: BorderSide(
                                                        color: calculateTextColor(
                                                            settings
                                                                .bottomColor)))),
                                            width: size.width > 900
                                                ? size.width /
                                                    (snapshot
                                                            .data!.daysInMonth *
                                                        percentage)
                                                : 40,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: headerText(
                                                (index + 1).toString(),
                                                color: DateFormat.EEEE().format(
                                                            DateTime(
                                                                snapshot.data!
                                                                    .currentYear,
                                                                snapshot.data!
                                                                    .currentMonth,
                                                                index + 1)) ==
                                                        "Sunday"
                                                    ? settings.sundayColor
                                                    : settings.bottomColor),
                                          ))),
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }));
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
