// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project



// #include "Math/Angle.hpp"
// #include "Math/Classify.hpp"

// #include <type_traits>

// struct GeoVector;

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:otto/domain/entities/math/angle.dart';
part 'geo_point.freezed.dart';

/// Geodetic coordinate expressed as Longitude and Latitude angles.
@freezed
class GeoPoint with _$GeoPoint {
  // Angle longitude;
  // Angle latitude;
  const GeoPoint._();
  
  // /// Non-initialising constructor.
  // GeoPoint()  = default;

  /// Constructor (supplied location)
  ///
  /// @param _Longitude Longitude of point
  /// @param _Latitude Latitude of point
  ///
  /// @return Initialised object
  const factory GeoPoint({required  Angle longitude, required Angle latitude})=_GeoPoint ;
   

  /// Construct an instance at the origin of the coordinate system.
  /// This is used to initialise the simulator when there is no better
  /// reference (home, map center).  The goal is to bootstrap the
  /// simulator when XCSoar is launched for the first time with an
  /// empty profile; it is pretty useless for anything else.
   factory  GeoPoint.zero()  {
    return GeoPoint(Angle.zero(), Angle.zero())=_Zero;
  }

  /// Construct an instance that is "invalid", i.e. IsValid() will
  /// return false.  The return value must not be used in any
  /// calculation.  This method may be used to explicitly declare a
  /// GeoPoint attribute as "invalid".
  factory  GeoPoint.invalid()  {
    return GeoPoint(Angle.zero(), Angle.fullCircle())=_Invalid;
  }

  // /// Set this instance to "invalid", i.e. IsValid() will
  // /// return false.  The return value must not be used in any
  // /// calculation.  This method may be used to explicitly declare a
  // /// GeoPoint attribute as "invalid".
  //  void setInvalid()  {
  //   longitude = Angle.Zero();
  //   latitude = Angle.FullCircle();
  // }

  /// Check if this object is "valid".  Returns false when it was
  /// constructed by Invalid().  This is not an extensive plausibility
  /// check; it is only designed to catch instances created by
  /// Invalid().
   bool isValid()   {
    return latitude <= Angle.halfCircle();
  }

  /// Check if both longitude and latitude are in the allowed range.
   bool check()   {
    return isFinite(longitude.native()) &&
      longitude >= -Angle.halfCircle() &&
      longitude <= Angle.halfCircle() &&
      isFinite(latitude.native()) &&
      latitude >= -Angle.quarterCircle() &&
      latitude <= Angle.quarterCircle();
  }

  /// Normalize the values, so this object can be used properly in
  /// calculations, without unintended side effects (such as -1 degrees
  /// vs 359 degrees). 
  GeoPoint normalize()  {
    return GeoPoint(longitude : longitude.asDelta(),
latitude:
     (latitude < -Angle.quarterCircle()) ? 
       -Angle.quarterCircle() :
 ((latitude > Angle.quarterCircle())?
       Angle.quarterCircle() :latitude)

    );
  }

  /// Find location a parametric distance along a vector from this point
  ///
  /// @param delta Vector to feed in
  /// @param t Parametric distance along delta to add [0,1]
  ///
  /// @return Location of point

  GeoPoint parametric( GeoPoint delta, double t) {
  return this + delta * t;
}


  /// Find location interpolated from this point towards end
  ///
  /// @param end Endpoint of interpolation
  /// @param t Parametric distance along this to end [0,1]
  ///
  /// @return Location of point

  GeoPoint interpolate( GeoPoint end, double t) {
  return (this) + (end - (this)) * t;
}

  /// Multiply a point by a factor (used for deltas)
  ///
  /// @param x Factor to magnify
  ///
  /// @return Modified point

   GeoPoint operator*( double x)   {
    return GeoPoint (longitude: longitude * x, latitude:
    latitude * x
    );
  }

  /// Add a delta to a point
  ///
  /// @param delta Delta to add
  ///
  /// @return Modified point

   GeoPoint operator+( GeoPoint delta)   {
    return GeoPoint(longitude: 
    longitude + delta.longitude,latitude:
    latitude + delta.latitude);

  }

  // /// Add a delta to a point
  // ///
  // /// @param delta Delta to add
  // ///
  // /// @return Modified point
  //   GeoPoint operator+=( GeoPoint delta)  {
  //  return GeoPoint(longitude: longitude + delta.longitude
  //   ,latitude:latitude + delta.latitude);
    
  // }

  /// Subtracts a delta from a point
  ///
  /// @param delta Delta to subtract
  ///
  /// @return Modified point

  GeoPoint operator-( GeoPoint delta)   {
    return GeoPoint(longitude: longitude - delta.longitude
    ,latitude:latitude - delta.latitude).normalize();

  }

//   /// Calculate great circle distance from this to the other
//   ///
//   /// @param other Other location
//   ///
//   /// @return Distance (m)

//   double Distance( GeoPoint other) {
//   return distance(this, other);
// }

//   /// Calculate great circle initial bearing from this to the other
//   ///
//   /// @param other Other location
//   ///
//   /// @return Bearing (deg)

//   Angle Bearing( GeoPoint other) {
//   return bearing(this, other);
// }

  /// Calculate great circle distance and initial bearing from this to the other

//   GeoVector DistanceBearing( GeoPoint &other){
//   GeoVector gv;
//   ::DistanceBearing(*this, other, &gv.distance, &gv.bearing);
//   return gv;
// }

  /// Like Distance(), but use a simplified faster formula that may be
  /// less accurate.

  double distanceS( GeoPoint other) {
  double distance;
  distanceBearingS(this, other, &distance, nullptr);
  return distance;
}

  /// Like Bearing(), but use a simplified faster formula that may be
  /// less accurate.

  Angle bearingS( GeoPoint other) {
  Angle angle;
  distanceBearingS(this, other, (Angle *)nullptr, &angle);
  return angle;
}

  /// Like DistanceBearing(), but use a simplified faster formula that
  /// may be less accurate.

//   GeoVector DistanceBearingS( GeoPoint other) {
//   GeoVector gv;
//   ::DistanceBearingS(this, other, gv.distance, gv.bearing);
//   return gv;
// }

  /// Find distance along a great-circle path that this point
  /// is projected to
  ///
  /// @param from Start location
  /// @param to End location
  ///
  /// @return Distance (m) along from-to line

  double projectedDistance( GeoPoint from,
                            GeoPoint to) {
  return projectedDistance(from, to, this);
}

  /// Find point a set distance along a great-circle path towards
  /// a destination
  ///
  /// @param destination End location
  /// @param distance distance (m)
  ///
  /// @return Location of point

  GeoPoint intermediatePoint( GeoPoint destination,
                             double distance) {
  return intermediatePoint(this, destination, distance);
}

  /// Find the nearest great-circle middle point between this point and
  /// the specified one.

  GeoPoint middle( GeoPoint other) {
  return middle(this, other);
}


  //  bool operator==(const GeoPoint &) const  = default;
  //  bool operator!=(const GeoPoint &) const  = default;
}

//static_assert(std::is_trivial<GeoPoint>::value, "type is not trivial");

/// Extension of GeoPoint for altitude (3d location in spherical space)
class AGeoPoint extends GeoPoint {
  /// < Nav reference altitude (m)
  double altitude;

  AGeoPoint._() ;

   AGeoPoint(GeoPoint p, double alt) 
    :base(p), altitude(alt) ;
}

// static_assert(std::is_trivial<AGeoPoint>::value, "type is not trivial");