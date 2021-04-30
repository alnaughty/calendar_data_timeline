import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tabular_calendar/models/date_data.dart';
import 'package:tabular_calendar/models/tabular_model.dart';
import 'package:tabular_calendar/widget/helper_widgets.dart';

class CalendarBody extends StatelessWidget with WidgetHelpers {
  List<TabularModel> data;
  CalendarBody({required this.data});
  @override
  Widget build(BuildContext context) {
    try{
      final Size size = MediaQuery.of(context).size;
      return Material(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: List.generate(data.length, (index) => Container(
            child: Row(
              children: [
                Container(
                  width: size.width * .1,
                  alignment: AlignmentDirectional.center,
                  height: 50,
                  child: Text(data[index].name),
                ),
                Expanded(
                  child: StreamBuilder<CurrentDate>(
                    stream: dateData.stream$,
                    builder: (context, snapshot) => Container(
                      width: double.infinity,
                      height: 60,
                      child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              snapshot.data!.daysInMonth,
                                  (index) => Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                                width: size.width > 900
                                    ? size.width /
                                    (snapshot.data!.daysInMonth *
                                        1.115)
                                    : 40,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
                                alignment:
                                AlignmentDirectional.center,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black54.withOpacity(0.6)
                                  ),
                                ),
                              ))),
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
      );
    }catch(e){
      return Center(
        child: Text("Please wait ..."),
      );
    }
  }
}
