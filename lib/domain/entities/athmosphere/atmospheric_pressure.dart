// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'atmospheric_pressure.freezed.dart';

const double k1 = 0.190263;
const double invK1 = 1.0 / k1;
const double k2 = 8.417286e-5;
const double invK2 = 1.0 / k2;

/// ICAO Standard Atmosphere calculations (valid in Troposphere, alt<11000m)
@freezed
abstract class AtmosphericPressure with _$AtmosphericPressure {
  /// [value] the pressure in hPa

  const factory AtmosphericPressure(
      {required

          /// Pressure in hPa
          final double
          value}) = _AtmosphericPressure;

  /// Returns an object representing zero pressure.  This value doesn't
  /// make a lot of practical sense (unless you're an astronaut), but
  /// it may be used internally to mark an instance of this class
  /// "invalid" (IsPlausible() returns false).
  factory AtmosphericPressure.zero() {
    return const _AtmosphericPressure(value: 0);
  }

  /// Returns an object representing the standard pressure (1013.25 hPa).
  factory AtmosphericPressure.standard() {
    return const _AtmosphericPressure(value: 1013.25);
  }

  factory AtmosphericPressure.pascal(double pressure) {
    return _AtmosphericPressure(value: (pressure / 100));
  }

  factory AtmosphericPressure.hectoPascal(double pressure) {
    return _AtmosphericPressure(value: pressure);
  }

  /// Is this a plausible value?
  bool isPlausible() {
    return value > 100 && value < 1200;
  }

  bool isPositive() {
    return value > 0;
  }

  double getPascal() {
    return getHectoPascal() * 100;
  }

  /// Access QNH value
  ///
  /// @return QNH value (hPa)
  double getHectoPascal() {
    return value;
  }

  // friend constexpr auto operator<=>(const AtmosphericPressure &,
  //                                   const AtmosphericPressure &) noexcept = default;

  // constexpr auto operator+(AtmosphericPressure other) const noexcept {
  //   return AtmosphericPressure{value + other.value};
  // }

  // constexpr auto operator-(AtmosphericPressure other) const noexcept {
  //   return AtmosphericPressure{value - other.value};
  // }

  /// Calculates the current QNH by comparing a pressure value to a
  /// known altitude of a certain location
  ///
  /// [pressure] Current pressure
  /// [alt_known] Altitude of a known location (m)
  static AtmosphericPressure findQNHFromPressure(
      AtmosphericPressure pressure, double altKnown) {
    return pressure.qnhAltitudeToStaticPressure(-altKnown);
  }

  /// Converts altitude with QNH=1013.25 reference to QNH adjusted altitude
  /// [alt] 1013.25-based altitude (m)
  /// @return QNH-based altitude (m)
  double pressureAltitudeToQNHAltitude(double alt) {
    return staticPressureToQNHAltitude(
        AtmosphericPressure.pressureAltitudeToStaticPressure(alt));
  }

  /// Converts QNH adjusted altitude to pressure altitude (with QNH=1013.25 as reference)
  /// [alt] QNH-based altitude(m)
  /// @return pressure altitude (m)
  double qnhAltitudeToPressureAltitude(double alt) {
    return staticPressureToPressureAltitude(qnhAltitudeToStaticPressure(alt));
  }

  /// Converts a pressure value to the corresponding QNH-based altitude
  ///
  /// See http://wahiduddin.net/calc/density_altitude.htm
  ///
  /// Example:
  /// QNH=1014, ps=100203 => alt = 100
  /// @see QNHAltitudeToStaticPressure
  /// [ps] Air pressure
  /// @return Altitude over QNH-based zero (m)
  double staticPressureToQNHAltitude(AtmosphericPressure ps) {
    return (pow(getHectoPascal(), k1) - pow(ps.getHectoPascal(), k1)) * invK2;
  }

  /// Converts a QNH-based altitude to the corresponding pressure
  ///
  /// See http://wahiduddin.net/calc/density_altitude.htm
  ///
  /// Example:
  /// alt= 100, QNH=1014 => ps = 100203 Pa
  /// @see StaticPressureToAltitude
  /// [alt] Altitude over QNH-based zero (m)
  /// @return Air pressure at given altitude
  AtmosphericPressure qnhAltitudeToStaticPressure(double alt) {
    return AtmosphericPressure.hectoPascal(
        pow((pow(getHectoPascal(), k1) - k2 * alt), invK1).toDouble());
  }

  /// Converts a pressure value to pressure altitude (with QNH=1013.25 as reference)
  /// [ps] Air pressure
  /// @return pressure altitude (m)
  static double staticPressureToPressureAltitude(AtmosphericPressure ps) {
    return AtmosphericPressure.standard().staticPressureToQNHAltitude(ps);
  }

  /// Converts a 1013.25 hPa based altitude to the corresponding pressure
  ///
  /// @see StaticPressureToAltitude
  /// [alt] Altitude over 1013.25 hPa based zero(m)
  /// @return Air pressure at given altitude
  factory AtmosphericPressure.pressureAltitudeToStaticPressure(double alt) {
    return AtmosphericPressure.standard().qnhAltitudeToStaticPressure(alt);
  }
}
