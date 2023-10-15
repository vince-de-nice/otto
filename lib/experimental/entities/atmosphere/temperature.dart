// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include <cmath>
// #include <compare> // for the defaulted spaceship operator

import 'dart:math';

/// The offset between 0 Kelvin and 0 degrees Celsius [K].
const double celsiusOffset = 273.15;

/// Convert a temperature from Kelvin to degrees Celsius.
double kelvinToCelsius(double kelvin) {
  return kelvin - celsiusOffset;
}

/// Convert a temperature from degrees Celsius to Kelvin.

double celsiusToKelvin(double celsius) {
  return celsius + celsiusOffset;
}

/// A temperature.  Internally, this is stored as a floating point
/// value in the SI unit "Kelvin".

class Temperature {
  final double value;
  const Temperature(this.value);

  const factory Temperature.fromNative(double value) = Temperature;

  const factory Temperature.fromKelvin(double kelvinValue) =
      Temperature.fromNative;

  factory Temperature.fromCelsius(double celsiusValue) {
    return Temperature.fromKelvin(celsiusToKelvin(celsiusValue));
  }

  double toNative() {
    return value;
  }

  double toKelvin() {
    return toNative();
  }

  double toCelsius() {
    return kelvinToCelsius(toKelvin());
  }

  // // friend constexpr auto operator<=>(const Temperature &,
  // //                                   const Temperature &) noexcept = default;

  // constexpr Temperature operator-() const  {
  //   return Temperature(-value);
  // }

  // constexpr Temperature operator-(Temperature other) const  {
  //   return Temperature(value - other.value);
  // }

  // Temperature &operator-=(Temperature other) noexcept {
  //   value -= other.value;
  //   return *this;
  // }

  // constexpr Temperature operator+(Temperature other) const  {
  //   return Temperature(value + other.value);
  // }

  // Temperature &operator+=(Temperature other)  {
  //   value += other.value;
  //   return *this;
  // }

  // constexpr Temperature operator*(double other) const  {
  //   return Temperature(value * other);
  // }

  // Temperature &operator*=(double other)  {
  //   value *= other;
  //   return *this;
  // }

  // constexpr Temperature operator/(double other) const  {
  //   return Temperature(value / other);
  // }

  // Temperature &operator/=(double other)  {
  //   value /= other;
  //   return *this;
  // }

  // Temperature absolute()   {
  //   return fromKelvin(value.);
  // }

  // static Temperature FromUser(double value) noexcept;
  // double ToUser() const noexcept;

  Temperature calculateDewPoint(
      Temperature temperature, double humidityPercent) {
    final double logEx =
        7.5 * temperature.toCelsius() / (237.3 + temperature.toCelsius()) +
            ((log(humidityPercent) / ln10) - 2);
    return Temperature.fromCelsius(logEx * 237.3 / (7.5 - logEx));
  }
}
