import 'package:calendar_data_timeline/calendar_data_timeline.dart';
import 'package:flutter/material.dart';

class WidgetHelpers {
  Text headerText(String text, {Color color = Colors.black54}) => Text(
        text,
        style: TextStyle(color: calculateTextColor(color), fontSize: 12),
        textAlign: TextAlign.center,
      );

  Color calculateTextColor(Color color) {
    return color.computeLuminance() >= 0.5 ? Colors.black54 : Colors.white;
  }

  Text bodyTitleText(String text, {Color color = Colors.black}) => Text(
        text,
        style: TextStyle(color: calculateTextColor(color), fontSize: 13.5),
      );

  Text headerLabelText(String text, {Color color = Colors.black}) => Text(
        text,
        style: TextStyle(color: calculateTextColor(color), fontSize: 15),
        textAlign: TextAlign.center,
      );



  Widget getLayout({LeftChildData? leftChild, required Widget rightChild}) {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          if (leftChild == null) ...{
            const SizedBox(
              width: 150,
            )
          } else ...{
            Container(
                width: 150,
                height: leftChild.height,
                color: leftChild.color,
                child: Center(
                  child: bodyTitleText(leftChild.string,
                      color: leftChild.color == Colors.transparent
                          ? Colors.white
                          : leftChild.color),
                )),
          },
          Expanded(child: rightChild)
        ],
      ),
    );
  }
}
