// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "Units/Unit.hpp"
// #include "util/StringBuffer.hxx"
// #include "util/Compiler.h"

// #include <tchar.h>

// class AtmosphericPressure;

import 'package:otto/domain/entities/athmosphere/atmospheric_pressure.dart';
import 'package:otto/domain/entities/units/units.dart';

/// Converts a double-based wing loading into a formatted string
/// @param value The double-based wing loading
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatUserWingLoading(double value, TCHAR *buffer,
                      bool include_unit = true){
  formatWingLoading(buffer, value, Units.getUserWingLoadingUnit(),
                    include_unit);
}

/// Converts a double-based mass into a formatted string
/// @param value The double-based mass
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatUserMass(double value, TCHAR *buffer,
               bool include_unit = true) {
  formatMass(buffer, value, Units.getUserMassUnit(), include_unit);
}


/// Converts a double-based Altitude into a formatted string
/// @param Altitude The double-based Altitude
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatUserAltitude(double value, TCHAR *buffer,
                   bool include_unit = true) {
  formatAltitude(buffer, value, Units.getUserAltitudeUnit(), include_unit);
}


static inline auto
formatUserAltitude(double value) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserAltitude(value, buffer.data());
  return buffer;
}

/// Converts a double-based Altitude into a formatted string of the alternate
/// altitude format
/// @param Altitude The double-based Altitude
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatAlternateUserAltitude(double value, TCHAR *buffer,
                            bool include_unit = true) {
  formatAltitude(buffer, value,
                 GetAlternateAltitudeUnit(Units.getUserAltitudeUnit()),
                 include_unit);
}


/// Converts a double-based Arrival Altitude into a formatted string
/// @param Altitude The double-based Arrival Altitude
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatRelativeUserAltitude(double value, TCHAR *buffer,
                           bool include_unit = true) {
  formatRelativeAltitude(buffer, value, Units.getUserAltitudeUnit(),
                         include_unit);
}

/// Converts a distance into a formatted string
/// @param value the distance
/// @param buffer buffer string to write to (pointer)
/// @param include_unit include the unit into the string?
/// @param precision the number of decimal places
void
formatUserDistance(double value, TCHAR *buffer,
                   bool include_unit = true, int precision = 0) {
  formatDistance(buffer, value, Units.getUserDistanceUnit(),
                 include_unit, precision);
}


static inline auto
formatUserDistance(double value,
                   bool include_unit = true, int precision = 0) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserDistance(value, buffer.data(), include_unit, precision);
  return buffer;
}

/// Converts a distance into a formatted string using the smaller version
/// of the user-defined distance unit (km -> m, nm -> ft, sm -> ft)
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
/// @param value the distance
/// @param include_unit include the unit into the string?
/// @param precision the number of decimal places
/// @return the unit used for output formatting
Unit
formatSmallUserDistance(TCHAR *buffer, double value,
                        bool include_unit = true, int precision = 0) {
  return formatSmallDistance(buffer, value, Units.getUserDistanceUnit(),
                             include_unit, precision);
}

/// Converts a double-based horizontal Distance into a formatted string
/// @param Distance The double-based Distance
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
Unit
formatUserDistanceSmart(double value, TCHAR *buffer,
                        bool include_unit = true,
                        double small_unit_threshold = 0,
                        double precision_threshold = 100) {
  return formatDistanceSmart(buffer, value, Units.getUserDistanceUnit(),
                             include_unit, small_unit_threshold,
                             precision_threshold);
}


static inline auto
formatUserDistanceSmart(double value, bool include_unit = true,
                        double small_unit_threshold = 0,
                        double precision_threshold = 100) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserDistanceSmart(value, buffer.data(), include_unit,
                          small_unit_threshold, precision_threshold);
  return buffer;
}

Unit
formatUserMapScale(double value, TCHAR *buffer,
                   bool include_unit = true) {
  return formatDistanceSmart(buffer, value, Units.getUserDistanceUnit(),
                             include_unit, 1000, 9.999);
}

/// Converts a double-based Speed into a formatted string
/// @param Speed The double-based Speed
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
/// @return True if buffer long enough, False otherwise
void
formatUserSpeed(double value, TCHAR *buffer,
                bool include_unit = true, bool Precision = true) {
  formatSpeed(buffer, value, Units.getUserSpeedUnit(), include_unit,
              precision);
}


static inline auto
formatUserSpeed(double value, bool precision=true) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserSpeed(value, buffer.data(), true, precision);
  return buffer;
}

/// Converts a double-based Speed into a formatted string
/// @param Speed The double-based Speed
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
/// @return True if buffer long enough, False otherwise
void
formatUserWindSpeed(double value, TCHAR *buffer,
                    bool include_unit = true, bool Precision = true) {
  formatSpeed(buffer, value, Units.getUserWindSpeedUnit(), include_unit,
              precision);
}



static inline auto
formatUserWindSpeed(double value, bool include_unit = true, bool precision=true) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserWindSpeed(value, buffer.data(), include_unit, precision);
  return buffer;
}

/// Convert a speed [m/s] to the user's task speed and format it into
/// a string.
///
/// @param value the speed value [m/s]
void
formatUserTaskSpeed(double value, TCHAR *buffer,
                    bool include_unit=true, bool precision=true) {
  formatSpeed(buffer, value, Units.getUserTaskSpeedUnit(), include_unit,
              precision);
}




static inline auto
formatUserTaskSpeed(double value, bool precision=true) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserTaskSpeed(value, buffer.data(), true, precision);
  return buffer;
}


static constexpr Unit
GetAlternateAltitudeUnit(Unit unit) 
{
  switch (unit) {
  case Unit.METER:
    return Unit.FEET;

  case Unit.FEET:
    return Unit.METER;

  default:
    return unit;
  }
}

/// Give the proper format to display the vertical speed
/// @param include_unit include the unit into the string?
/// @param include_sign include the sign into the string?
/// @return the format
const TCHAR *
GetUserVerticalSpeedformat(bool include_unit = false,
                           bool include_sign = true) {
  return GetVerticalSpeedformat(Units.getUserVerticalSpeedUnit(), include_unit,
                                include_sign);
}

/// Give the basic step for pressure editing
/// @return the step
double
GetUserVerticalSpeedStep() {
  return GetVerticalSpeedStep(Units.getUserVerticalSpeedUnit());
}

/// Converts a double-based vertical Speed into a formatted string
/// @param Speed The double-based vertical Speed
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
/// @param include_sign include the sign into the string?
/// @return True if buffer long enough, False otherwise
void
formatUserVerticalSpeed(double value, TCHAR *buffer,
                        bool include_unit = true, bool include_sign = true) {
  formatVerticalSpeed(buffer, value, Units.getUserVerticalSpeedUnit(),
                      include_unit, include_sign);
}


static inline auto
formatUserVerticalSpeed(double value, bool include_unit = true, bool include_sign = true) 
{
  BasicStringBuffer<TCHAR, 32> buffer;
  formatUserVerticalSpeed(value, buffer.data(), include_unit, include_sign);
  return buffer;
}

/// Converts a temperature into a formatted string
/// @param temperature The double-based vertical Speed
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void
formatUserTemperature(double value, TCHAR *buffer,
                      bool include_unit = true) {
  formatTemperature(buffer, value, Units.getUserTemperatureUnit(),
                    include_unit);
}


/// Converts a double-based Pressure into a formatted string
/// @param Pressure The double-based Pressure
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
void formatUserPressure(AtmosphericPressure value, TCHAR *buffer,
                        bool include_unit = true) {
  formatPressure(buffer, pressure, Units.getUserPressureUnit(), include_unit);
}

/// Give the proper format to display the pressure
/// @param buffer buffer string to write to (pointer)
/// @param size Size of the buffer
/// @return True if buffer long enough, False otherwise
const TCHAR *
getUserPressureformat(bool include_unit = false) {
  return getPressureformat(Units.getUserPressureUnit(), include_unit);
}

/// Give the basic step for pressure editing
/// @return the step
double
getUserPressureStep() {
  return getPressureStep(Units.current.pressure_unit);
}