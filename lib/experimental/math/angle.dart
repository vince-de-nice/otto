// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #include "Trig.hpp"
// #include "FastTrig.hpp"
// #include "Constants.hpp"

// #include <type_traits>

// #ifdef DO_PRINT
// #include <iosfwd>
// #endif

// #include <cmath>
// #include <compare>

import 'dart:core';
import 'dart:math' as math;

import 'package:otto/math/constants.dart';
import 'package:otto/math/dmm.dart';
import 'package:otto/math/dms.dart';

/// Container class for angular variables.
class Angle {
  Angle(this.value);
  final double value;

  // /**
  //  * The default constructor does not initialize the value.  It must
  //  * not be used until it is assigned.
  //  */
  // Angle();

  factory Angle.zero() {
    return Angle.native(0);
  }

  factory Angle.native(double value) = Angle;

  /// Construct an instance that describes a "full circle" (360
  /// degrees).
  factory Angle.fullCircle() {
    return Angle.native(M_2PI);
  }

  /// Construct an instance that describes a "half circle" (180
  /// degrees).
  factory Angle.halfCircle() {
    return Angle.native(M_PI);
  }

  /// Construct an instance that describes a "quarter circle" 90
  /// degrees).
  factory Angle.quarterCircle() {
    return Angle.native(M_PI_2);
  }

  double native() {
    return value;
  }

  factory Angle.degrees(double value) {
    return Angle(value * DEG_TO_RAD);
  }

  factory Angle.radians(double value) {
    return Angle(value);
  }

  double degrees() {
    return value * RAD_TO_DEG;
  }

  double radians() {
    return value;
  }

  double hours() {
    return value * 24 / M_2PI;
  }

  factory Angle.fromDms(DMS dms) => Angle.degrees(dms.toFloat());

  // factory  Angle.fromDmsValues(unsigned d, unsigned m=0, unsigned s=0,
  //                                bool n=false)  {
  //   return DMS(d, m, s, n);
  // }

  /// Converts this Angle to degrees, minute, seconds and a
  /// bool-based east/north variable
  ///
  /// @param dd Degrees (pointer)
  /// @param mm Minutes (pointer)
  /// @param ss Seconds (pointer)
  /// @param east True if East, False if West (pointer)

  DMS toDMS() {
    bool negative = value < 0;
    //TODO: fix here
    double val = value; //lround(AbsoluteDegrees() * 3600);

    double seconds = val % 60;
    val /= 60;

    double minutes = val % 60;
    val /= 60;

    return DMS(val.toInt(),
        minutes: minutes.toInt(), seconds: seconds.toInt(), negative: negative);
  }

  /// Converts this Angle to degrees, minute, decimal minutes and a
  /// bool-based east/north variable
  DMM toDMM() {
    //TODO fix
    double val = value; //lround(AbsoluteDegrees() * 60000);
    double degrees = val / 60000;
    val %= 60000;
    double minutes = val / 1000;
    double decimalMinutes = val % 1000;

    return DMM(degrees.toInt(), minutes.toInt(), decimalMinutes.toInt());
  }

  //TODO
  // Angle absolute()  {
  //   return Angle(math.fabs(native()));
  // }

  /// Calculates the tangent of the Angle.
  double tan() {
    return math.tan(radians());
  }

  /// Calculates the sine of the Angle.
  double sin() {
    return math.sin(radians());
  }

  double accurateHalfSin() {
    return half().sin();
  }

  /// Calculates the cosine of the Angle.

  double cos() {
    return math.cos(radians());
  }

  // /// Faster but more inaccurate version of sin()
  //  double fastsine()  {
  //   return (math.fastsine(native()));
  // }

  // /// Faster but more inaccurate version of cos()
  //  double fastcosine()  {
  //   return (math.fastcosine(native()));
  // }

  //  double invfastcosine()  {
  //   return (math.invfastcosine(native()));
  // }

  // /// Returns the sine of the Angle as an integer
  // /// in the range between -1024 and 1024.
  //  int ifastsine()  {
  //   return (math.ifastsine(native()));
  // }

  // /// Returns the cosine of the Angle as an integer
  // /// in the range between -1024 and 1024.
  //  int ifastcosine()  {
  //   return (math.ifastcosine(native()));
  // }

  bool isPositive() {
    return value > 0;
  }

  bool isNegative() {
    return value < 0;
  }

//TODO
  // (double sin, double cos)  sinCos()  {
  //   double sin = math.sin(radians());
  //   double cos = math.cos(radians());
  //   return (sin,cos);
  // }

//   double absoluteDegrees()
// {
//   return absolute().degrees();
// }
//   double absoluteRadians()
// {
//   return absolute().radians();
// }

  // void Flip()  {
  //   value = -value;
  // }

  factory Angle.flipped(double angleValue) {
    return Angle.native(-angleValue);
  }

  /// Limits the angle (theta) to -180 - +180 degrees
  /// @return Output angle (-180 - +180 degrees)
  Angle asDelta() {
    // assert(!isnan(value));
    // assert(!isinf(value));
    // assert(fabs(value) < 100 * fullCircle().native());

// #ifndef FIXED_MATH
//   /* same workaround as in AsBearing() */
//   if (!isnormal(value))
//     return Zero();
// #endif

    var retval = this;

    while (retval <= -Angle.halfCircle()) {
      retval = retval + Angle.fullCircle();
    }

    while (retval > Angle.halfCircle()) {
      retval = retval - Angle.fullCircle();
    }

    return retval;
  }

  /// Limits the angle (theta) to 0 - 360 degrees
  /// @return Output angle (0-360 degrees)
  Angle asBearing() {
    // assert(!isnan(value));
    // assert(!isinf(value));
    // assert(fabs(value) < 100 * FullCircle().Native());

// #ifndef FIXED_MATH
//   /* Workaround for endless loops below; this is only for release
//      builds.  Debug builds will crash due to assertion failure.  Right
//      now, I don't know where those abnormal values come from, but I
//      hope we'll find out soon - until that happens, this workaround
//      reduces some user frustration with XCSoar freezes. */
//   if (!isnormal(value))
//     return Zero();
// #endif

    Angle retval = Angle(value);

    while (retval < Angle.zero()) {
      retval = retval + Angle.fullCircle();
    }
    while (retval >= Angle.fullCircle()) {
      retval = retval - Angle.fullCircle();
    }

    return retval;
  }

  /// Returns half of this angle.  This is only useful (and valid) when
  /// the angle has been normalized with AsDelta().

  Angle half() {
    return Angle(value * 0.5);
  }

  /// Rotate angle by 180 degrees and limit to 0 - 360 degrees
  /// @return Output angle (0 - 360 degrees)
  Angle reciprocal() {
    return (this + Angle.halfCircle()).asBearing();
  }

  Angle halfAngle(Angle end) {
    if (value == end.value) {
      return reciprocal();
    } else if (value > end.value) {
      if ((this - end) < Angle.halfCircle()) {
        return (this + end).half().reciprocal();
      } else {
        return (this + end).half();
      }
    } else {
      if ((end - this) < Angle.halfCircle()) {
        return (this + end).half().reciprocal();
      } else {
        return (this + end).half();
      }
    }
  }

  /// Computes a certain fraction between the two angles.
  ///
  /// @param fraction a fraction between 0 and 1
  /// @return the resulting Angle, not normalized
  Angle fraction(Angle end, double fraction) {
    if (value == end.value) {
      return Angle(value);
    }

    Angle diff = (end - this).asDelta();
    return Angle(value + diff.value * fraction);
  }

  Angle operator *(double x) {
    return Angle(value * x);
  }

  Angle operator /(double x) {
    return Angle(value / x);
  }

  Angle operator +(Angle x) {
    return Angle(value + x.value);
  }

  Angle operator -(Angle x) {
    return Angle(value - x.value);
  }

  Angle operator -() {
    return Angle(-value);
  }

  //   Angle operator*=( double x)  {
  //   value *= x;
  //   return *this;
  // }

  //   Angle operator+=(Angle x)  {
  //   value += x.value;
  //   return *this;
  // }

  //   Angle operator-=(Angle x)  {
  //   value -= x.value;
  //   return *this;
  // }

  bool operator <(Angle other) {
    return value < other.value;
  }

  bool operator >(Angle other) {
    return value > other.value;
  }

  bool operator <=(Angle other) {
    return value <= other.value;
  }

  bool operator >=(Angle other) {
    return value >= other.value;
  }

  //TODO

  // /// Return the positive difference between two angles.
  // Angle fdim(Angle x) {
  //   return Angle.native(fdim(value, x.value));
  // }

  /// Is this angle between the other two values?  If "end" is smaller
  /// than "start", then wraparound is calculated correctly.
  bool between(Angle start, Angle end) {
    Angle width = (end - start).asBearing();
    Angle delta = (this - start).asBearing();

    return delta <= width;
  }

  static Angle asin(double x) {
    return Angle.radians(math.asin(x));
  }

  static Angle acos(double x) {
    return Angle.radians(math.acos(x));
  }

  /// Returns the angle based on the input of both a x- and y-coordinate.
  /// This is the mathematical angle where zero means along x axis and
  /// the positive direction is counter-clockwise!
  /// @param x x-coordinate
  /// @param y y-coordinate
  /// @return Counter-clockwise angle between the x-axis and the given coordinate
  // static Angle fromXY( double x,  double y)  {
  //   return Angle::Radians(atan2(y,x));
  // }

//   /// Check whether the two angles are roughly equal.
//   bool compareRoughly(Angle other, {Angle threshold = const Angle.degrees(10)}) {
//   const Angle delta = (this - other).asDelta();
//   return delta >= -threshold && delta <= threshold;
// }
}

// static_assert(std::is_trivial<Angle>::value, "type is not trivial");
