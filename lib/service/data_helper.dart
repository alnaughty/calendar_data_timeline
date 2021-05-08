class DataHelper {
  /// check if two dates are the same
  bool isSameDate(DateTime d1, DateTime d2) =>
      d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;

  /// check if dates are in range
  bool inRange(DateTime from, DateTime to, DateTime comp) {
    return comp.isAfter(from) && comp.isBefore(to);
  }

  ///check if dates are in range and is the same
  /// month and year of the current date displayed in the calendar
  bool inRangePlus(DateTime from, DateTime to, DateTime compare) {
    DateTime initDay = compare.subtract(Duration(days: compare.day - 1));
    return ((from.month < compare.month && to.month > compare.month) &&
            (from.year == compare.year && to.year == compare.year))
        ? true
        : (inRange(from, to, initDay) || inRange(from, to, compare)) ||
            (inRange(initDay, compare, from) && inRange(initDay, compare, to));
  }
}
