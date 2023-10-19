// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'package:otto/domain/entities/geo/geo_point.dart';
import 'package:otto/domain/entities/math/angle.dart';
import 'package:otto/domain/entities/time/broken_date.dart';
import 'package:otto/domain/entities/time/broken_time.dart';
import 'package:otto/infrastructure/igc/igc_declaration.dart';
import 'package:otto/infrastructure/igc/igc_extensions.dart';
import 'package:otto/infrastructure/igc/igc_fix.dart';
import 'package:otto/infrastructure/igc/igc_header.dart';


IGCFix? iGCFix;
IGCHeader? iGCHeader;
IGCExtensions? iGCExtensions;
IGCDeclarationHeader? iGCDeclarationHeader;
IGCDeclarationTurnpoint? iGCDeclarationTurnpoint;
BrokenDate? brokenDate;
BrokenTime? brokenTime;
GeoPoint? geoPoint;


// using std.string_view_literals.operator""sv;
/// Character table for base-36.
const String c36 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

/// Convert a 5 digit logger serial to a 3 letter logger id.
static int importDeprecatedLoggerSerial(String id)
{
  id[0] = c36[(serial / 36 / 36) % 36];
  id[1] = c36[(serial / 36) % 36];
  id[2] = c36[serial % 36];
  id[3] = 0;
  return id;
}

/// Parse an igc "A" record.

 IGCHeader? igcParseHeader(String line )

{
  /* sample from CAI302: "ACAM3OV" */
  /* sample from Colibri: "ALXN13103FLIGHT:1" */

  if (line[0] != 'A') {
    return null;
  }

  ++line;
  size_t length = strlen(line);
  if (length < 6) {
    return null;
  }

  memcpy(header.manufacturer, line, 3);
  header.manufacturer[3] = 0;
  line += 3;

  char *endptr;
  unsigned long serial = strtoul(line, &endptr, 10);
  if (endptr == line + 5) {
    /* deprecated: numeric serial, 5 digits (e.g. from Colibri) */
    serial = importDeprecatedLoggerSerial(header.id);
    line = endptr;
  } else {
    memcpy(header.id, line, 3);
    header.id[3] = 0;
    line += 3;
  }

  String colon = strchr(line, ':');
  header.flight = colon != NULL
    ? strtoul(colon + 1, NULL, 10)
    : 0;

  return true;
}

/// Parse an IGC "HFDTE" record.
///
/// @return true on success, false if the line was not recognized
BrokenDate? date igcParseDateRecord(String line ){
  line = stringAfterPrefix(line, "HFDTE");
  if (line == nullptr) {
    return null;
  }

  if (auto date = StringAfterPrefix(line, "DATE"sv))
    line = date;

  if (line[0] == ':') {
    line += 1;
  }

  char *endptr;
  unsigned long value = strtoul(line, &endptr, 10);
  if (endptr != line + 6) {
    return null;
  }

  date.year = 1990 + (value + 10) % 100; /* Y2090 bug! */
  date.month = (value / 100) % 100;
  date.day = value / 10000;

  return date.IsPlausible();
}


static int parseTwoDigits(String p)
{
  if (!IsDigitASCII(p[0]) || !IsDigitASCII(p[1])) {
    return -1;
  }

  return (p[0] - '0') * 10 + (p[1] - '0');
}

static bool checkThreeAlphaNumeric(String src)
{
  return isAlphaNumericASCII(src[0]) && isAlphaNumericASCII(src[1]) &&
    isAlphaNumericASCII(src[2]);
}

/// Parse an IGC "I" record.
///
/// @return true on success, false if the line was not recognized
bool igcParseExtensions(String buffer, IGCExtensions extensions)
{
  if (*buffer++ != 'I') {
    return false;
  }

  int count = parseTwoDigits(buffer);
  if (count < 0) {
    return false;
  }

  buffer += 2;

  extensions.clear();

  while (count-- > 0) {
    const int start = parseTwoDigits(buffer);
    if (start < 8) {
      return false;
    }

    buffer += 2;

    const int finish = parseTwoDigits(buffer);
    if (finish < start) {
      return false;
    }

    buffer += 2;

    if (!checkThreeAlphaNumeric(buffer))
      return false;

    if (extensions.full()) {
      return false;
    }

    IGCExtension &x = extensions.append();
    x.start = start;
    x.finish = finish;
    memcpy(x.code, buffer, 3);
    x.code[3] = 0;

    buffer += 3;
  }

  return true;
}

/// Parse an unsigned integer from the given string range
/// (null-termination is not necessary).
///
/// @param p the string
/// @param end the end of the string
/// @return the result, or -1 on error
static int parseUnsigned(String p, String end)
{
  int value = 0;

  for (; p < end; ++p) {
    if (!isDigitASCII(*p)) {
      return -1;
    }

    value = value * 10 + (*p - '0');
  }

  return value;
}

static void parseExtensionValue(String p, String end, int value_r)
{
  int value = parseUnsigned(p, end);
  if (value >= 0) {
    value_r = value;
  }
}



/// Parse the first #n characters from the input string.  If the string
/// is not long enough, nothing is parsed.  This is used to account for
/// columns that are longer than specified; according to LXNav, this is
/// used for decimal places (which are ignored by this function).
static void parseExtensionValueN(String p, String end, size_t n,
                     int16_t &value_r)
{
  if (n > (size_t)(p - end)) {
    /* string is too short */
    return;
  }

  int value = parseUnsigned(p, p + n);
  if (value >= 0) {
    value_r = value;
  }
}

/// Parse a location in IGC file format. (DDMMmmm[N/S]DDDMMmmm[E/W])
///
/// @return true on success, false if the location was not recognized
GeoPoint? location igcParseLocation(String buffer ){
  int lat_degrees, lat_minutes, lon_degrees, lon_minutes;
  String lat_char, lon_char;

  if (sscanf(buffer, "%02u%05u%c%03u%05u%c",
             &lat_degrees, &lat_minutes, &lat_char,
             &lon_degrees, &lon_minutes, &lon_char) != 6) {
    return null;
  }

  if (lat_degrees >= 90 || lat_minutes >= 60000 ||
      (lat_char != 'N' && lat_char != 'S')) {
    return null;
  }

  if (lon_degrees >= 180 || lon_minutes >= 60000 ||
      (lon_char != 'E' && lon_char != 'W')) {
    return null;
  }

  var latitude = Angle.degrees(lat_degrees +  lat_minutes / 60000);
  if (lat_char == 'S') {
    latitude= latitude.fliped();
  }

  Angle longitude = Angle.degrees(lon_degrees + lon_minutes / 60000);
  if (lon_char == 'W') {
    longitude = longitude.fliped();
  }

return GeoPoint(longitude: longitude, latitude: latitude);
}

/// Parse an IGC "B" record.
(IGCExtensions? extensions, IGCFix? fix) igcParseFix(String buffer ){
  if (*buffer != 'B') {
    return (null,null);
  }

  BrokenTime time;
  if (!igcParseTime(buffer + 1, time)) {
    return (null,null);
  }

  char valid_char;
  int gps_altitude, pressure_altitude;

  if (sscanf(buffer + 24, "%c%05d%05d",
             &valid_char, &pressure_altitude, &gps_altitude) != 3) {
    return (null,null);
  }

  if (valid_char == 'A') {
    fix.gps_valid = true;
  } else if (valid_char == 'V'){
    fix.gps_valid = false;
   } else {
    return (null,null);

   }
  fix.gps_altitude = gps_altitude;
  fix.pressure_altitude = pressure_altitude;

  if (!igcParseLocation(buffer + 7, fix.location)) {
        return (null,null);

  }

  fix.time = time;

  fix.ClearExtensions();

  const size_t line_length = strlen(buffer);
  for (auto i = extensions.begin(), end = extensions.end(); i != end; ++i) {
    const IGCExtension &extension = *i;
    assert(extension.start > 0);
    assert(extension.finish >= extension.start);

    if (extension.finish > line_length) {
      /* exceeds the input line length */
      continue;
    }

    String start = buffer + extension.start - 1;
    String finish = buffer + extension.finish;

    if (StringIsEqual(extension.code, "ENL"))
      parseExtensionValue(start, finish, fix.enl);
    else if (StringIsEqual(extension.code, "RPM"))
      parseExtensionValue(start, finish, fix.rpm);
    else if (StringIsEqual(extension.code, "HDM"))
      parseExtensionValue(start, finish, fix.hdm);
    else if (StringIsEqual(extension.code, "HDT"))
      parseExtensionValue(start, finish, fix.hdt);
    else if (StringIsEqual(extension.code, "TRM"))
      parseExtensionValue(start, finish, fix.trm);
    else if (StringIsEqual(extension.code, "TRT"))
      parseExtensionValue(start, finish, fix.trt);
    else if (StringIsEqual(extension.code, "GSP"))
      parseExtensionValueN(start, finish, 3, fix.gsp);
    else if (StringIsEqual(extension.code, "IAS"))
      parseExtensionValueN(start, finish, 3, fix.ias);
    else if (StringIsEqual(extension.code, "TAS"))
      parseExtensionValueN(start, finish, 3, fix.tas);
    else if (StringIsEqual(extension.code, "SIU"))
      parseExtensionValue(start, finish, fix.siu);
  }


}

/// Parse a time in IGC file format (HHMMSS).
BrokenTime? igcParseTime(String buffer ){
  int hour, minute, second;

  if (sscanf(buffer, "%02u%02u%02u", &hour, &minute, &second) != 3) {
    return null;
  }

  time = BrokenTime(hour, minute, second);
  return time.IsPlausible();
}

 BrokenDate? date igcParseDate(String buffer)
{
  int day, month, year;

  if (sscanf(buffer, "%02u%02u%02u", &day, &month, &year) != 3) {
    return null;
  }

  date = BrokenDate(year + 2000, month, day);
  return date.isPlausible() ? date: null;
}

/// Parse an IGC "C" header record.

IGCDeclarationHeader? igcParseDeclarationHeader(String line ){
  if (*line != 'C' || strlen(line) < 25) {
    return null;
  }

  if (!igcParseDate(line + 1, header.datetime)) {
    return null;
  }

  if (!igcParseTime(line + 7, header.datetime)) {
    return null;
  }

  if (!igcParseDate(line + 13, header.flight_date)) {
    header.flight_date.Clear();
  }

  if (!sscanf(line + 23, "%02u", &header.num_turnpoints) ||
      header.num_turnpoints > 99) {
    return null;
  }

  std.copy(line + 19, line + 23, header.task_id);

  header.task_name = line + 25;
  return true;
}

/// Parse an IGC "C" turnpoint record.
IGCDeclarationTurnpoint? igcParseDeclarationTurnpoint(String line  ){
  if (line[0] != 'C' || line.length < 18) {
    return null;
  }
final loc = igcParseLocation(line.substring(1));
  if (loc == null) {
    return null;
  }

 return IGCDeclarationTurnpoint(location:  loc!,name:  line.substring(18));
  
}