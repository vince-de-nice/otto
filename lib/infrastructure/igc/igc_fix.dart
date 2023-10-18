// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project



// #include "Geo/GeoPoint.hpp"
// #include "time/BrokenTime.hpp"

 import 'package:otto/domain/entities/geo/geo_point.dart';

NMEAInfo nMEAInfo;


class IGCFix
{
  BrokenTime time;

  GeoPoint location;

  bool gps_valid;

  int gps_altitude, pressure_altitude;

  /* extensions follow */

  /// Engine noise level [0 to 999].  null if undefined.
  int? enl;

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  int? rpm;

  /// Magnetic heading [degrees].  null if undefined.
  int? hdm;

  /// True heading [degrees].  null if undefined.
  int? hdt;

  /// Magnetic track [degrees].  null if undefined.
  int? trm;

  /// True track [degrees].  null if undefined.
  int? trt;

  /// Ground speed [km/h].  null if undefined.
  int? gsp;

  /// Indicated airspeed [km/h].  null if undefined.
  int? ias;

  /// True airspeed [km/h].  null if undefined.
  int? tas;

  /// Satellites in use.  null if undefined.
  int? siu;

   void clearExtensions()  {
    enl = rpm = null;
    hdm = hdt = trm = trt = null;
    gsp = ias = tas = null;
    siu = null;
  }

  //  void class namePainter extends CustomPainter {
   
  //    @override
  //    void paint(Canvas canvas, Size size) {
  //    }
   
  //    @override
  //    bool shouldRepaint(namePainter oldDelegate) => false;
   
  //    @override
  //    bool shouldRebuildSemantics(namePainter oldDelegate) => false;
  //  }lear()  {
  //   time = BrokenTime::Invalid();
  //   ClearExtensions();
  // }

   bool IsDefined()   {
    return time.IsPlausible();
  }

  /// Copy data from the #NMEAInfo object into this.
  ///
  /// @return true if this object is a valid new fix
  bool Apply(const NMEAInfo &basic) {
  if (!basic.time_available) {
    return false;
  }

  if (!IsDefined() && !basic.location_available) {
    return false;
  }

  /* "Use A for a 3D fix and V for a 2D fix (no GPS altitude) or for
     no GPS data" */
  gps_valid = basic.location_available && basic.gps_altitude_available;

  if (basic.location_available)
    location = basic.location;

  time = basic.date_time_utc;

  gps_altitude = basic.gps_altitude_available
    ? (int)basic.gps_altitude
    : 0;

  pressure_altitude = basic.pressure_altitude_available
    ? (int)basic.pressure_altitude
    : (basic.baro_altitude_available
       /* if there's only baro altitude and no QNH, assume baro
          altitude is good enough */
       ? (int)basic.baro_altitude
       /* if all else fails, fall back to GPS altitude, to avoid
          application bugs (SeeYou is known for display errors) */
       : gps_altitude);

  ClearExtensions();

  enl = basic.engine_noise_level_available
    ? (int?) basic.engine_noise_level
    : null;

  trt = basic.track_available
    ? (int?) basic.track.Degrees()
    : null;

  gsp = basic.ground_speed_available
    ? (int?) Units::ToUserUnit(basic.ground_speed, Unit::KILOMETER_PER_HOUR)
    : null;

  if (basic.airspeed_available) {
    ias = (int?) Units::ToUserUnit(basic.indicated_airspeed, Unit::KILOMETER_PER_HOUR);
    tas = (int?) Units::ToUserUnit(basic.true_airspeed, Unit::KILOMETER_PER_HOUR);
  }

  siu = basic.gps.satellites_used_available
    ? (int?) basic.gps.satellites_used
    : null;

  return true;
}
}