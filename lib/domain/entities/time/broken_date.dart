// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'package:otto/domain/entities/time/broken_time.dart';

/// A broken-down representation of a date.
class BrokenDate {
  /// Absolute year, e.g. "2010".
  int year;

  /// Month number, 1-12.
  int month;

  /// Day of month, 1-31.
  int day;

  /// Day of the week (0-6, 0: sunday).  -1 means the value has not
  /// been determined.
  late int dayOfWeek;

  /// Non-initializing default constructor.
  // BrokenDate()  = default;

  BrokenDate(this.year, this.month, this.day) {
    // Calculate day-of-week using Zeller's Congruence algorithm
    int m = month;
    int y = year;
    if (m < 3) {
      m += 12;
      y -= 1;
    }

    int k = y % 100;
    int j = y ~/ 100;

    int dow = (day + (13 * (m + 1)) ~/ 5 + k + (k ~/ 4) + (j ~/ 4) - 2 * j) % 7;

    // Adjust the result to match the day of the week format (0=Saturday)
    dayOfWeek = (dow + 6) % 7;
  }

  // bool operator==(BrokenDate other)   {
  //   return year == other.year && month== other.month && day == other.day;
  // }

  bool operator >(BrokenDate other) {
    return year > other.year ||
        (year == other.year &&
            (month > other.month || (month == other.month && day > other.day)));
  }

  bool operator <(BrokenDate other) {
    return other > this;
  }

  /// Clears the object, to make the Plausible() check returns false.
  void clear() {
    year = 0;
  }

  /// Returns an instance that fails the Plausible() check.
  static BrokenDate invalid() {
    return BrokenDate(0, 0, 0);
  }

  /// Does this object contain plausible values?
  bool isPlausible() {
    return year >= 1800 &&
        year <= 2500 &&
        month >= 1 &&
        month <= 12 &&
        day >= 1 &&
        day <= 31;
  }

  /// Returns the current system date in UTC.

  static BrokenDate todayUTC() {
    final dt = DateTime.now().toUtc();
    
    return BrokenDate(dt.year,dt.month,dt.day);
  }

  void incrementDay() {
    assert(isPlausible());

    final maxDay = getDaysInMonth(month, year);

    ++day;

    if (day > maxDay) {
      /* roll over to next month */
      day = 1;
      ++month;
      if (month > 12) {
        /* roll over to next year */
        month = 1;
        ++year;
      }
    }

    if (dayOfWeek >= 0) {
      ++dayOfWeek;
      if (dayOfWeek >= 7) {
        dayOfWeek = 0;
      }
    }
  }

  void decrementDay() {
    assert(isPlausible());

    --day;

    if (day < 1) {
      --month;

      if (month < 1) {
        --year;
        month = 12;
      }

      day = getDaysInMonth(month, year);
    }
  }

  static int getDaysInMonth(int year, int month) {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      return isLeapYear ? 29 : 28;
    }
    const List<int> daysInMonth = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month - 1];
  }

  // /// Returns the number of calendar days that have passed since the
  // /// two #BrokenDate structs.  The result may be negative if #other is
  // /// bigger than #this.

  // int daysSince(BrokenDate other) {
  //   const oneDaySecs = 24 * 60 * 60;

  //   final BrokenTime midnight = BrokenTime.midnight();
  //   const BrokenDateTime a = BrokenDateTime(this, midnight).ToTimePoint();
  //   const BrokenDateTime b = BrokenDateTime(other, midnight).ToTimePoint();
  //   const delta = a - b;
  //   return delta ~/ oneDaySecs;
  // }

  /// @brief Creates BrokenDate from julian date
  ///
  /// @param julian_date as integer (floored)
  /// @return BrokenDate
  static BrokenDate fromJulianDate(int julianDate) {
    // Convert Julian date BrokenDate

    int a = julianDate + 32044;
    int b = (4 * a + 3) ~/ 146097;
    int c = a - (146097 * b) ~/ 4;
    int d = (4 * c + 3) ~/ 1461;
    int e = c - (1461 * d) ~/ 4;
    int m = (5 * e + 2) ~/ 153;

    int day = e - (153 * m + 2) ~/ 5 + 1;
    int month = m + 3 - 12 * (m ~/ 10);
    int year = 100 * b + d - 4800 + (m ~/ 10);

    return BrokenDate(year, month, day);
  }
}

// static_assert(std::is_trivial<BrokenDate>::value, "type is not trivial");
