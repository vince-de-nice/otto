// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project



#include "Geo/GeoPoint.hpp"
#include "time/BrokenTime.hpp"

struct NMEAInfo;

struct IGCFix
{
  BrokenTime time;

  GeoPoint location;

  bool gps_valid;

  int gps_altitude, pressure_altitude;

  /* extensions follow */

  /**
   * Engine noise level [0 to 999].  Negative if undefined.
   */
  int16_t enl;

  /**
   * Forward thrust, e.g. engine rpm [0 to 999].  Negative if
   * undefined.
   */
  int16_t rpm;

  /**
   * Magnetic heading [degrees].  Negative if undefined.
   */
  int16_t hdm;

  /**
   * True heading [degrees].  Negative if undefined.
   */
  int16_t hdt;

  /**
   * Magnetic track [degrees].  Negative if undefined.
   */
  int16_t trm;

  /**
   * True track [degrees].  Negative if undefined.
   */
  int16_t trt;

  /**
   * Ground speed [km/h].  Negative if undefined.
   */
  int16_t gsp;

  /**
   * Indicated airspeed [km/h].  Negative if undefined.
   */
  int16_t ias;

  /**
   * True airspeed [km/h].  Negative if undefined.
   */
  int16_t tas;

  /**
   * Satellites in use.  Negative if undefined.
   */
  int16_t siu;

   void ClearExtensions() noexcept {
    enl = rpm = -1;
    hdm = hdt = trm = trt = -1;
    gsp = ias = tas = -1;
    siu = -1;
  }

   void Clear() noexcept {
    time = BrokenTime::Invalid();
    ClearExtensions();
  }

   bool IsDefined() const noexcept {
    return time.IsPlausible();
  }

  /**
   * Copy data from the #NMEAInfo object into this.
   *
   * @return true if this object is a valid new fix
   */
  bool Apply(const NMEAInfo &basic) {
  if (!basic.time_available)
    return false;

  if (!IsDefined() && !basic.location_available)
    return false;

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
    ? (int16_t) basic.engine_noise_level
    : -1;

  trt = basic.track_available
    ? (int16_t) basic.track.Degrees()
    : -1;

  gsp = basic.ground_speed_available
    ? (int16_t) Units::ToUserUnit(basic.ground_speed, Unit::KILOMETER_PER_HOUR)
    : -1;

  if (basic.airspeed_available) {
    ias = (int16_t) Units::ToUserUnit(basic.indicated_airspeed, Unit::KILOMETER_PER_HOUR);
    tas = (int16_t) Units::ToUserUnit(basic.true_airspeed, Unit::KILOMETER_PER_HOUR);
  }

  siu = basic.gps.satellites_used_available
    ? (int16_t) basic.gps.satellites_used
    : -1;

  return true;
}
}