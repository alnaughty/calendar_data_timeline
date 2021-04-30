import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tabular_calendar/models/date_data.dart';
import 'package:tabular_calendar/models/header_settings.dart';
import 'package:tabular_calendar/widget/helper_widgets.dart';

class CalendarHeader extends StatelessWidget with WidgetHelpers {
  final String? itemLabel;
  final HeaderSettings settings;

  CalendarHeader({this.itemLabel, required this.settings});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
        child: StreamBuilder<CurrentDate>(
            stream: dateData.stream$,
            builder: (context, snapshot) {
              return Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      color: itemLabel != null
                          ? settings.topColor
                          : Colors.transparent,
                      width: size.width * .1,
                      alignment: AlignmentDirectional.center,
                      child: Text(itemLabel ?? ""),
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
                                              color: settings.topColor,
                                              border: Border(
                                                  right: BorderSide(
                                                      color: calculateTextColor(
                                                          settings.topColor)))),
                                          width: size.width > 900
                                              ? size.width /
                                                  (snapshot.data!.daysInMonth *
                                                      1.115)
                                              : 40,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: headerText(
                                              DateFormat.EEEE(settings.locale).format(DateTime(
                                                  snapshot.data!.currentYear,
                                                  snapshot.data!.currentMonth,
                                                  index + 1)).substring(0,3)[0].toUpperCase() + DateFormat.EEEE(settings.locale).format(DateTime(
                                                  snapshot.data!.currentYear,
                                                  snapshot.data!.currentMonth,
                                                  index + 1)).substring(0,3).substring(1),
                                              color: Colors.white),
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
                                              color: settings.bottomColor,
                                              border: Border(
                                                  right: BorderSide(
                                                      color: calculateTextColor(
                                                          settings
                                                              .bottomColor)))),
                                          width: size.width > 900
                                              ? size.width /
                                                  (snapshot.data!.daysInMonth *
                                                      1.115)
                                              : 40,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: Text((index + 1).toString()),
                                        ))),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              );
            }));
  }
}
