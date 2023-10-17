// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include <span>

// #include <tchar.h>

struct BrokenDateTime;
struct GeoPoint;

/**
 * Generate a task declaration takeoff line according to IGC GNSS
 * specification 3.6.3
 */
String
IGCMakeTaskTakeoff() 
{
  return "C0000000N00000000ETAKEOFF";
}

String
IGCMakeTaskLanding() 
{
  return "C0000000N00000000ELANDING";
}

/**
 * IGC GNSS specification 3.6.1
 */
String
formatIGCTaskTimestamp(  DateTime dateTime,
                       int numberOfTurnpoints){


   "C%02u%02u%02u%02u%02u%02u0000000000%02u",
          // DD  MM  YY  HH  MM  SS  DD  MM  YY IIII TT
          dateTime.day,
          dateTime.month,
          dateTime.year % 100,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          numberOfTurnpoints - 2;
}

/**
 * @return a pointer to the end of the buffer
 */
String
FormatIGCLocation(char *buffer, const GeoPoint &location){
  char latitude_suffix = location.latitude.IsNegative() ? 'S' : 'N';
  unsigned latitude =
    (unsigned)uround(fabs(location.latitude.Degrees() * 60000));

  char longitude_suffix = location.longitude.IsNegative() ? 'W' : 'E';
  unsigned longitude =
    (unsigned)uround(fabs(location.longitude.Degrees() * 60000));

  sprintf(buffer, "%02u%05u%c%03u%05u%c",
          latitude / 60000, latitude % 60000, latitude_suffix,
          longitude / 60000, longitude % 60000, longitude_suffix);

  return buffer + strlen(buffer);
}

void
FormatIGCTaskTurnPoint(std::span<char> dest, const GeoPoint &location,
                       const TCHAR *name) {
  char *p = dest.data();
  char *const end = p + dest.size();
  *p++ = 'C';
  p = FormatIGCLocation(p, location);
  p = CopyASCIIUpper(p, end - p - 1, name);
  *p = '\0';
}