import 'package:flame_chat/shared/app_strings.dart';

/// Date class
class Date {
  final String date;
  final String month;
  final int day;
  final int year;
  final int hour;
  final int minute;
  final String period;
  final String time;
  final String dateTime;

  Date(this.date, this.month, this.day, this.year, this.hour, this.minute,
      this.period, this.time, this.dateTime);

  /// Converts [DateTime] object to a [Date] class
  factory Date.toDate(DateTime dT) {
    final String date;
    final String month;
    final int day;
    final int year;
    int hour;
    final int minute;
    final String time;
    final String period;
    final String dateTime;

    /// Reformats the number by adding a zero if it's a unit
    String zeroFormat(int num) {
      if (num < 10) {
        return '0$num';
      }
      return num.toString();
    }

    List<String> months = [
      AppString.cJan,
      AppString.cFeb,
      AppString.cMar,
      AppString.cApr,
      AppString.cMay,
      AppString.cJan,
      AppString.cJul,
      AppString.cAug,
      AppString.cSep,
      AppString.cOct,
      AppString.cNov,
      AppString.cDec
    ];
    day = dT.day;
    month = months[dT.month - 1];
    year = dT.year;
    hour = dT.hour;
    minute = dT.minute;
    date = '$month ${zeroFormat(day)}, $year';

    if (hour < 12) {
      period = 'AM';
    } else {
      period = 'PM';
    }
    if (hour % 12 == 0) {
      hour = 12;
    } else {
      hour = hour % 12;
    }
    time = '${zeroFormat(hour)}:${zeroFormat(minute)} $period';
    dateTime = '$date $time';
    return Date(date, month, day, year, hour, minute, period, time, dateTime);
  }
}
