// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #include "Geo/GeoPoint.hpp"
// #include "time/BrokenTime.hpp"

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otto/domain/entities/geo/geo_point.dart';
import 'package:otto/domain/entities/time/broken_time.dart';

part 'igc_fix.freezed.dart';

@unfreezed
class IGCFix with _$IGCFix {
  IGCFix._();
  factory IGCFix({
    required BrokenTime time,
    required GeoPoint location,
    required bool gpsValid,
    required int gpsAltitude,
    pressureAltitude,

    /* extensions follow */

    /// Engine noise level [0 to 999].  null if undefined.
    int? enl,

    /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
    /// undefined.
    int? rpm,

    /// Magnetic heading [degrees].  null if undefined.
    int? hdm,

    /// True heading [degrees].  null if undefined.
    int? hdt,

    /// Magnetic track [degrees].  null if undefined.
    int? trm,

    /// True track [degrees].  null if undefined.
    int? trt,

    /// Ground speed [km/h].  null if undefined.
    int? gsp,

    /// Indicated airspeed [km/h].  null if undefined.
    int? ias,

    /// True airspeed [km/h].  null if undefined.
    int? tas,

    /// Satellites in use.  null if undefined.
    int? siu,
  }) = _IGCFix;

  void clearExtensions() {
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

  bool isDefined() {
    return time.isPlausible();
  }

//TODO (differently)
//   /// Copy data from the #NMEAInfo object into this.
//   ///
//   /// @return true if this object is a valid new fix
//   bool apply(const NMEAInfo &basic) {
//   if (!basic.timeAvailable) {
//     return false;
//   }

//   if (!IsDefined() && !basic.locationAvailable) {
//     return false;
//   }

//   /* "Use A for a 3D fix and V for a 2D fix (no GPS altitude) or for
//      no GPS data" */
//   gpsValid = basic.locationAvailable && basic.gpsAltitudeAvailable;

//   if (basic.locationAvailable)
//     location = basic.location;

//   time = basic.dateTimeUtc;

//   gpsAltitude = basic.gpsAltitudeAvailable
//     ? (int)basic.gpsAltitude
//     : 0;

//   pressureAltitude = basic.pressureAltitudeAvailable
//     ? (int)basic.pressureAltitude
//     : (basic.baroAltitudeAvailable
//        /* if there's only baro altitude and no QNH, assume baro
//           altitude is good enough */
//        ? (int)basic.baroAltitude
//        /* if all else fails, fall back to GPS altitude, to avoid
//           application bugs (SeeYou is known for display errors) */
//        : gpsAltitude);

//   clearExtensions();

//   enl = basic.engineNoiseLevelAvailable
//     ? (int?) basic.engineNoiseLevel
//     : null;

//   trt = basic.trackAvailable
//     ? (int?) basic.track.Degrees()
//     : null;

//   gsp = basic.groundSpeedAvailable
//     ? (int?) Units.toUserUnit(basic.groundSpeed, Unit.kilometerPerHour)
//     : null;

//   if (basic.airspeedAvailable) {
//     ias = (int?) Units.toUserUnit(basic.indicatedAirspeed, Unit.kilometerPerHour);
//     tas = (int?) Units.toUserUnit(basic.trueAirspeed, Unit.kilometerPerHour);
//   }

//   siu = basic.gps.satellitesUsedAvailable
//     ? (int?) basic.gps.satellitesUsed
//     : null;

//   return true;
// }
}
