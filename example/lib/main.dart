import 'package:flutter/material.dart';
import 'package:calendar_data_timeline/calendar_data_timeline.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Data Timeline Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarDataTimeline(

        data: <CalendarContent>[
          CalendarContent(name: "Zeus Cajurao", dates: <DateFromTo>[
            DateFromTo(
                color: Colors.red,
                from: DateTime.now(),
                to: DateTime.now().add(Duration(days: 4))),
            DateFromTo(
                color: Colors.blue,
                from: DateTime.now().subtract(Duration(days: 42)),
                to: DateTime.now().subtract(Duration(days: 2))),
            DateFromTo(
                color: Colors.green,
                from: DateTime.now().subtract(Duration(days: 10)),
                to: DateTime.now().add(Duration(days: 6))),
          ]),
          CalendarContent(name: "John Doe", dates: <DateFromTo>[
            DateFromTo(
                color: Colors.green,
                from: DateTime.now(),
                to: DateTime.now().add(Duration(days: 4))),
            DateFromTo(
                color: Colors.yellow,
                from: DateTime.now().subtract(Duration(days: 42)),
                to: DateTime.now().subtract(Duration(days: 2))),
            DateFromTo(
              color: Colors.blue,
              from: DateTime.parse("2021-02-28"),
              to: DateTime.now(),)
          ]),
        ],
        settings: HeaderSettings(
            locale: 'en_US',
            topColor: Colors.blue,
            bottomColor: Colors.grey.shade900,
        ),
        sundayColor: Colors.grey.shade300,
        bodySettings: BodySettings(
            titleBGColor: Colors.blue,

            backgroundColor: Colors.grey.shade100
        ),
      ),
    );
  }
}
