// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "Logger/GRecord.hpp"
// #include "IGCFix.hpp"
// #include "io/FileOutputStream.hxx"
// #include "io/BufferedOutputStream.hxx"

// #include <array>
// #include <string_view>

// #include <tchar.h>

import 'package:otto/domain/entities/time/broken_time.dart';
import 'package:otto/infrastructure/igc/igc_fix.dart';
import 'package:sprintf/sprintf.dart';

class Path;
struct GPSState;
struct BrokenDateTime;
struct NMEAInfo;
struct GeoPoint;

class IGCWriter {
  FileOutputStream file;
  BufferedOutputStream buffered;

  GRecord grecord;

  IGCFix fix;

  std::array<char, 255> buffer;

//public:
  /// Throws on error.
  explicit IGCWriter(Path path):file(path,
        /* we use CREATE_VISIBLE here so the user can recover partial
           IGC files after a crash/battery failure/etc. */
        FileOutputStream::Mode::CREATE_VISIBLE),
   buffered(file)
{
  fix.clear();

  grecord.Initialize();
}

  void Flush() {
    buffered.Flush();
  }

  void Sign(){
  grecord.FinalizeBuffer();
  grecord.WriteTo(buffered);
}

//private:
  /// Finish writing the line.
  void _commitLine(std::string_view line){
  buffered.Write(AsBytes(line));
  buffered.Write('\n');

  grecord.AppendRecordToBuffer(line);
}

  void _writeLine(const char *line){
  assert(strchr(line, '\r') == NULL);
  assert(strchr(line, '\n') == NULL);

  char *const dest = buffer.data();
  char *const end = dest + buffer.size();

  char *p = CopyIGCString(dest, end, line);

  _commitLine(std::string_view(dest, p - dest));
}

  void WriteLine(const char *a, const TCHAR *b){
  size_t a_length = strlen(a);
  assert(a_length < buffer.size());

  char *const dest = buffer.data();
  char *const end = dest + buffer.size(), *p = dest;

  p = std::copy_n(a, a_length, p);
  p = CopyIGCString(p, end, b);

  _commitLine(std::string_view(dest, p - dest));
}

  static const char *GetHFFXARecord();
  static const char *GetIRecord();
  static double GetEPE(const GPSState &gps);
  /// Satellites in use if logger fix quality is a valid gps
  static int GetSIU(const GPSState &gps);

public:
  /// @param logger_id the ID of the logger, consisting of exactly 3
  /// alphanumeric characters (plain ASCII)
  void WriteHeader(const BrokenDateTime &date_time,
                   const TCHAR *pilot_name,
                   const TCHAR *copilot_name,
                   const TCHAR *aircraft_model,
                   const TCHAR *aircraft_registration,
                   const TCHAR *competition_id,
                   const char *logger_id, const TCHAR *driver_name,
                   bool simulator){
  /*
   * HFDTE141203  <- should be UTC, same as time in filename
   * HFFXA100
   * HFPLTPILOT:JOHN WHARINGTON
   * HFCM2CREW2: LISA HAMMOND
   * HFGTYGLIDERTYPE:LS 3
   * HFGIDGLIDERID:VH-WUE
   * HFDTM100GPSDATUM:WGS-1984
   * HFRFWFIRMWAREVERSION:3.6
   * HFRHWHARDWAREVERSION:3.4
   * HFFTYFR TYPE:GARRECHT INGENIEURGESELLSCHAFT,VOLKSLOGGER 1.0
   * HFCIDCOMPETITIONID:WUE
   * HFCCLCOMPETITIONCLASS:FAI
   */

  assert(logger_id != NULL);
  assert(strlen(logger_id) == 3);

  char buffer[100];

  // Flight recorder ID number MUST go first..
  sprintf(buffer, "AXCS%s", logger_id);
  _writeLine(buffer);

  if (date_time.IsDatePlausible()) {
    sprintf(buffer, "HFDTE%02u%02u%02u",
            date_time.day, date_time.month, date_time.year % 100);
    _writeLine(buffer);
  }

  if (!simulator)
    _writeLine(GetHFFXARecord());

  _writeLine("HFPLTPILOTINCHARGE:", pilot_name);
  _writeLine("HFCM2CREW2:", copilot_name);
  _writeLine("HFGTYGLIDERTYPE:", aircraft_model);
  _writeLine("HFGIDGLIDERID:", aircraft_registration);
  _writeLine("HFCIDCOMPETITIONID:", competition_id);
  _writeLine("HFFTYFRTYPE:XCSOAR,XCSOAR ", XCSoar_VersionStringOld);
  _writeLine("HFGPS:", driver_name);

  _writeLine("HFDTM100DATUM:WGS-1984");

  _writeLine(GetIRecord());
}

  void AddDeclaration(const GeoPoint &location, const TCHAR *ID){
  char c_record[64];
  FormatIGCTaskTurnPoint(c_record, location, id);
  _writeLine(c_record);
}

  void StartDeclaration(const BrokenDateTime &date_time,
                        const int number_of_turnpoints){
  if (date_time.IsPlausible()) {
    char buffer[64];
    FormatIGCTaskTimestamp(buffer, date_time, number_of_turnpoints);
    _writeLine(buffer);
  }

  _writeLine(IGCMakeTaskTakeoff());
}
  void EndDeclaration(){
  // TODO bug: this is causing problems with some analysis software
  // maybe it's because the date and location fields are bogus
  _writeLine(IGCMakeTaskLanding());
}

  void LoggerNote(const TCHAR *text){
  _writeLine("LPLT", text);
}

  void LogPoint(const IGCFix &fix, int epe, int satellites){
  char b_record[128];
  char *p = b_record;

  sprintf(p, "B%02d%02d%02d", fix.time.hour, fix.time.minute, fix.time.second);
  p += strlen(p);

  p = FormatIGCLocation(p, fix.location);

  sprintf(p, "%c%05d%05d%03d%02d",
          fix.gps_valid ? 'A' : 'V',
          NormalizeIGCAltitude(fix.pressure_altitude),
          NormalizeIGCAltitude(fix.gps_altitude),
          epe, satellites);

  _writeLine(b_record);
  Flush();
}
  void LogPoint(const NMEAInfo &gps_info){
  if (fix.Apply(gps_info))
    LogPoint(fix,
             gps_info.location_available ? (int)GetEPE(gps_info.gps) : 0,
             GetSIU(gps_info.gps));
}
  void LogEvent(const IGCFix &fix, int epe, int satellites, const char *event)
  {
  LogEvent(fix.time, event);

  // tech_spec_gnss.pdf says we need a B record immediately after an E record
  LogPoint(fix, epe, satellites);
}

  void LogEvent(const NMEAInfo &gps_info, const char *event){
  LogEvent(gps_info.date_time_utc, event);

  // tech_spec_gnss.pdf says we need a B record immediately after an E record
  LogPoint(gps_info);
}

  void LogEmptyFRecord(const BrokenTime &time){
  char f_record[32];
  sprintf(f_record, "F%02u%02u%02u", time.hour, time.minute, time.second);
  _writeLine(f_record);
}
  void logFRecord( BrokenTime time, [ Iterable<int> satellite_ids]){
  String f_record=  sprintf( "F%02u%02u%02u", [time.hour, time.minute, time.second]);

  for (int i = 0, length = 7; i < GPSState.MAXSATELLITES; ++i) {
    if (satellite_ids[i] > 0) {
      sprintf(f_record + length, "%02d", satellite_ids[i]);
      length += 2;
    }
  }

  _writeLine(f_record);
}

  void logEvent( BrokenTime time, {String event = ""}){

  final eRecord =sprintf( "E%02d%02d%02d%s",
        [  time.hour, time.minute, time.second, event]);

  _writeLine(eRecord);
}



  /// Applies range checks to the specified altitude value and converts
  /// it to an integer suitable for printing in the IGC file.
static  int
normalizeIGCAltitude(int value) 
{
  if (value < -9999) {
    /* for negative values, there are only 4 characters left (after
       the minus sign), and besides that, IGC does not support a
       journey towards the center of the earth */
    return -9999;
  }

  if (value >= 99999) {
    /* hooray, new world record! .. or just some invalid value; we
       have only 5 characters for the altitude, so we must clip it at
       99999 */
    return 99999;
  }

  return value;
}
}
