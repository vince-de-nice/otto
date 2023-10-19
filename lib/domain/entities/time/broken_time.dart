// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include <type_traits>

// #include <chrono>
// #include <cstdint>

import 'package:freezed_annotation/freezed_annotation.dart';
part 'broken_time.freezed.dart';

/// A broken-down representation of a time.
@freezed
class BrokenTime with _$BrokenTime {
 const BrokenTime._();

  const factory BrokenTime({required DateTime time}) = _BrokenTime;

  factory BrokenTime.hms(
      {required int hour, required int minute, int second = 0}) {
    return  BrokenTime(time:  DateTime.utc(1900, 1, 1, hour, minute, second));
  }

  // /// Hour of day, 0-23.
  int get hour => time.hour;

  // /// Minute, 0-59.
  int get minute => time.minute;

  // /// Second, 0-59.
  int get second => time.second;

  // bool operator==( BrokenTime other)  {
  //   return hour == other.hour && minute == other.minute &&
  //     second == other.second;
  // }

  bool operator >(BrokenTime other) {
    return hour > other.hour ||
        (hour == other.hour &&
            (minute > other.minute ||
                (minute == other.minute && second > other.second)));
  }

  bool operator <(BrokenTime other) {
    return other > this;
  }

  static BrokenTime midnight() {
    return BrokenTime.hms(hour: 0, minute: 0);
  }

  /// Returns an instance that fails the Plausible() check.
  static BrokenTime invalid() {
    return BrokenTime.hms(hour: 24, minute: 60, second: 60);
  }

  /// Does this object contain plausible values?
  bool isPlausible() {
    return hour < 24 && minute < 60 && second < 60;
  }

  /// Returns the number of seconds which have passed on this day.
  int getSecondOfDay() {
    return hour * 3600 + minute * 60 + second;
  }

  int secondsSinceMidnight() {
    return getSecondOfDay();
  }

  /// Construct a BrokenTime object from the specified number of
  /// seconds which have passed on this day.
  ///
  /// @param second_of_day 0 .. 3600*24-1
  static BrokenTime fromSecondOfDay(int secondOfDay) {
    assert(secondOfDay < 3600 * 24);

    int hour = secondOfDay ~/ 3600;
    int secondOfHour = secondOfDay % 3600;
    return BrokenTime.hms(
        hour: hour, minute: secondOfHour ~/ 60, second: secondOfHour % 60);
  }

  /// Construct a BrokenTime object from the specified duration since
  /// midnight.
  //template<class Rep, class Period>
  static BrokenTime fromSinceMidnight(int secondsSinceMidnight) {
    return fromSecondOfDay(secondsSinceMidnight);
  }

  /// A wrapper for FromSecondOfDay() which allows values bigger than
  /// or equal to 3600*24.
  static BrokenTime fromSecondOfDayChecked(int secondOfDay) {
    return fromSecondOfDay(secondOfDay % (3600 * 24));
  }

  /// A wrapper for FromSinceMidnight() which allows values bigger than
  /// one day.
  //template<class Rep, class Period>

  static BrokenTime fromSinceMidnightChecked(int secondsSinceMidnight) {
    return fromSecondOfDayChecked(secondsSinceMidnight);
  }

  /// Returns the number of minutes which have passed on this day.
  int getMinuteOfDay() {
    return hour * 60 + minute;
  }

  /// Construct a BrokenTime object from the specified number of
  /// minutes which have passed on this day.
  ///
  /// @param minute_of_day 0 .. 60*24-1
  static BrokenTime fromMinuteOfDay(int minuteOfDay) {
    assert(minuteOfDay < 60 * 24);

    return BrokenTime.hms(hour: minuteOfDay ~/ 60, minute: minuteOfDay % 60);
  }

  /// A wrapper for FromMinuteOfDay() which allows values bigger than
  /// or equal to 60*24.
  static BrokenTime fromMinuteOfDayChecked(int minuteOfDay) {
    return fromMinuteOfDay(minuteOfDay % (60 * 24));
  }

  /// Returns a BrokenTime that has the specified number of seconds
  /// added to it.  It properly wraps around midnight.
  ///
  /// @param seconds the number of seconds to add; may be negative
  BrokenTime operator +(int deltaSeconds) {
    assert(isPlausible());

    deltaSeconds += secondsSinceMidnight();
    while (deltaSeconds < 0) {
      deltaSeconds += 24 * 3600;
    }

    return fromSecondOfDayChecked(deltaSeconds);
  }

  BrokenTime operator -(int deltaSeconds) {
    return this + (-deltaSeconds);
  }
}

// static_assert(std::is_trivial<BrokenTime>::value, "type is not trivial");