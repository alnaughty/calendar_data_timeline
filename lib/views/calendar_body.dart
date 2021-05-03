import 'package:calendar_data_timeline/constant.dart';
import 'package:flutter/material.dart';
import 'package:calendar_data_timeline/models/body_settings.dart';
import 'package:calendar_data_timeline/models/date_data.dart';
import 'package:calendar_data_timeline/models/calendar_content.dart';
import 'package:calendar_data_timeline/widget/helper_widgets.dart';
import 'package:intl/intl.dart';


class CalendarBody extends StatelessWidget with WidgetHelpers {
  List<CalendarContent> data;
  final BodySettings bodySettings;

  CalendarBody({required this.data, required this.bodySettings});

  @override
  Widget build(BuildContext context) {
    try {
      final Size size = MediaQuery
          .of(context)
          .size;
      return Material(
        child: ListView.separated(
          physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) => Container(
              child: Row(
                children: [
                  Container(
                    width: size.width * .1,
                    alignment: AlignmentDirectional.center,
                    height: 60,
                    color: bodySettings.titleBGColor,
                    child: Padding(
                      padding: EdgeInsets.all((size.width * .1) * .1),
                      child: FittedBox(
                        child: bodyTitleText(data[index].name,
                            color: bodySettings.titleBGColor),
                      ),
                    ),
                  ),
                  Expanded(
                    child: StreamBuilder<CurrentDate>(
                      stream: dateData.stream$,
                      builder: (context, snapshot) {
                        if(snapshot.hasError){
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if(snapshot.hasData){
                          return Container(
                            width: size.width - 10,
                            height: 60,
                            color: bodySettings.backgroundColor,
                            child: Stack(
                              children: List.generate(
                                  data[index].dates.length,
                                      (dataIndex) => Container(
                                    height: 60,
                                    width: double.infinity,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                        snapshot.data!.daysInMonth,
                                            (daysIndex) => Container(
                                          height: 60,
                                          width: size.width > 900
                                              ? size.width /
                                              (snapshot.data!
                                                  .daysInMonth *
                                                  percentage)
                                              : 40,
                                          decoration: BoxDecoration(
                                              borderRadius: DateFormat.EEEE().format(DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth, daysIndex + 1)) == "Sunday" ? BorderRadius.circular(0) : BorderRadius.horizontal(
                                                  left: isSameDate(data[index].dates[dataIndex].from, DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth-1, daysIndex + 1))
                                                      ? Radius.circular(size
                                                      .width >
                                                      900
                                                      ? size.width /
                                                      (snapshot.data!.daysInMonth *
                                                          bodySettings.radius)
                                                      : 40)
                                                      : Radius.circular(
                                                      0),
                                                  right: isSameDate(
                                                      data[index]
                                                          .dates[dataIndex]
                                                          .to,
                                                      DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth-1, daysIndex + 1))
                                                      ? Radius.circular(size.width > 900 ? size.width / (snapshot.data!.daysInMonth * bodySettings.radius) : 40)
                                                      : Radius.circular(0)),
                                              color: DateFormat.EEEE().format(DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth, daysIndex + 1)) == "Sunday" ? bodySettings.sundayColor : inRange(data[index].dates[dataIndex].from, data[index].dates[dataIndex].to, DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth-1, daysIndex + 1)) || (isSameDate(data[index].dates[dataIndex].from, DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth-1, daysIndex + 1)) || isSameDate(data[index].dates[dataIndex].to, DateTime(snapshot.data!.currentYear, snapshot.data!.currentMonth-1, daysIndex + 1))) ? data[index].dates[dataIndex].color.withOpacity(0.5) : Colors.transparent),
                                        ),
                                      ),
                                    ),
                                  )),
                            ),
                          );
                        }
                        return Center(
                          child: Text("Loading"),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
            separatorBuilder: (context,_) => Container(
              width: double.infinity,
              height: 0.5,
              color: Colors.black54,

            ),
            itemCount: data.length
        ),
      );
    } catch (e) {
      return Center(
        child: Text("Please wait ..."),
      );
    }
  }
}
