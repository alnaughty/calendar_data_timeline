class DataHelper {
  bool isSameDate(DateTime d1, DateTime d2) =>
      d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;

  bool inRange(DateTime from, DateTime to, DateTime comp) {
    return comp.isAfter(from) && comp.isBefore(to);
  }

  bool inRangePlus(DateTime from, DateTime to, DateTime compare) {
    DateTime initDay = compare.subtract(Duration(days: compare.day - 1));
    return ((from.month < compare.month && to.month > compare.month) && (from.year == compare.year && to.year == compare.year))
        ? true
        :  (inRange(from, to, initDay) || inRange(from, to, compare)) || (inRange(initDay, compare, from) && inRange(initDay, compare, to));
  }
}