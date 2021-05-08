import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:calendar_data_timeline/models/date_data.dart';
import 'package:intl/date_symbol_data_local.dart' as localize;

class CalendarControl extends StatelessWidget {
  ///this is for date's locale (e.g. 'en_US')
  final String locale;

  /// initializer
  void init() {
    localize.initializeDateFormatting();
  }

  CalendarControl({required this.locale}) {
    init();
  }

  @override
  Widget build(BuildContext context) {
    try {
      return Material(
          child: StreamBuilder<CurrentDate>(
              stream: dateData.stream$,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              Icons.chevron_left,
                              size: 35,
                            ),
                            onPressed: () {
                              dateData.updateData();
                            }),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(DateFormat.yMMMM(locale)
                            .format(DateTime(snapshot.data!.currentYear,
                                snapshot.data!.currentMonth, 0))
                            .toUpperCase()),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              Icons.chevron_right,
                              size: 35,
                            ),
                            onPressed: () {
                              dateData.updateData(isNext: true);
                            })
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text("Please Wait ..."),
                  );
                }
              }));
    } catch (e) {
      return Center(
        child: Text(e.toString()),
      );
    }
  }
}
