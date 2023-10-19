// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project


import 'package:otto/domain/entities/geo/geo_point.dart';
import 'package:sprintf/sprintf.dart';

/// Generate a task declaration takeoff line according to IGC GNSS
/// specification 3.6.3
String igcMakeTaskTakeoff() {
  return "C0000000N00000000ETAKEOFF";
}

String igcMakeTaskLanding() {
  return "C0000000N00000000ELANDING";
}

/// IGC GNSS specification 3.6.1
String formatIGCTaskTimestamp(DateTime dateTime, int numberOfTurnpoints) {
  return sprintf(
      "C%02u%02u%02u%02u%02u%02u0000000000%02u",
      // DD  MM  YY  HH  MM  SS  DD  MM  YY IIII TT
      [
        dateTime.day,
        dateTime.month,
        dateTime.year % 100,
        dateTime.hour,
        dateTime.minute,
        dateTime.second,
        numberOfTurnpoints - 2
      ]);
}

/// @return a pointer to the end of the buffer
String formatIGCLocation(GeoPoint location) {
  final String latitudeSuffix = location.latitude.isNegative() ? 'S' : 'N';
  final double latitude = (location.latitude.degrees().abs() * 60000);

  final String longitudeSuffix = location.longitude.isNegative() ? 'W' : 'E';
  final double longitude = (location.longitude.degrees().abs() * 60000);

  return sprintf("%02u%05u%c%03u%05u%c", [
    latitude / 60000,
    latitude % 60000,
    latitudeSuffix,
    longitude / 60000,
    longitude % 60000,
    longitudeSuffix
  ]);
}

String formatIGCTaskTurnPoint(GeoPoint location, String name) {
  return "C${formatIGCLocation(location)}${name.toUpperCase()}";
}
