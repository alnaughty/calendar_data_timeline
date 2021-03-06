import 'package:rxdart/rxdart.dart';

class DateData {
  BehaviorSubject<CurrentDate> _data = new BehaviorSubject.seeded(CurrentDate(
      currentMonth: DateTime.now().month + 1,
      currentYear: DateTime.now().year,
      daysInMonth: DateTime(DateTime.now().year, DateTime.now().month + 1, 0)
          .toUtc()
          .difference(DateTime(DateTime.now().year, DateTime.now().month, 0))
          .inDays));

  Stream<CurrentDate> get stream$ => _data.stream;

  CurrentDate get current => _data.value!;

  void updateData({bool isNext = false}) {
    int toCheck = this.current.currentMonth;
    if (isNext) {
      toCheck++;
      this.current.daysInMonth = DateTime(this.current.currentYear, toCheck, 0)
          .toUtc()
          .difference(
              DateTime(this.current.currentYear, this.current.currentMonth, 0))
          .inDays;
      if (this.current.currentMonth < 12) {
        this.current.currentMonth++;
      } else {
        this.current.currentMonth = 1;
        this.current.currentYear++;
      }
    } else {
      toCheck--;
      this.current.daysInMonth =
          DateTime(this.current.currentYear, this.current.currentMonth - 1, 0)
              .toUtc()
              .difference(DateTime(this.current.currentYear, toCheck - 1, 0))
              .inDays;
      if (this.current.currentMonth > 1) {
        this.current.currentMonth--;
      } else {
        this.current.currentMonth = 12;
        this.current.currentYear--;
      }
    }
    _data.add(this.current);
  }
}

DateData dateData = DateData();

///Singleton for dateData

class CurrentDate {
  ///Current date is the current date the package will view.

  int currentYear;

  ///as per the name suggest it is the current date's current year
  int currentMonth;

  ///as per the name suggest it is the current date's current month
  int daysInMonth;

  ///as per the name suggest it is the current date's number of days

  CurrentDate(
      {required this.currentMonth,
      required this.currentYear,
      required this.daysInMonth});
}
