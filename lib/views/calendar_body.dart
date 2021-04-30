import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tabular_calendar/models/body_settings.dart';
import 'package:tabular_calendar/models/date_data.dart';
import 'package:tabular_calendar/models/tabular_model.dart';
import 'package:tabular_calendar/widget/helper_widgets.dart';

class CalendarBody extends StatelessWidget with WidgetHelpers {
  List<TabularModel> data;
  final BodySettings bodySettings;
  CalendarBody({required this.data, required this.bodySettings});
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
                  color: bodySettings.titleBGColor,
                  child: bodyTitleText(data[index].name, color: bodySettings.titleBGColor),
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
                                    color: bodySettings.onCellShadeColor,
                                width: size.width > 900
                                    ? size.width /
                                    (snapshot.data!.daysInMonth *
                                        1.115)
                                    : 40,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10),
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
