// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

/*! @file
 * @brief Library for calculating Earth dimensions
 *
 * This library provides general functions for calculating dimensions
 * on the Earth with GPS coordinates.  The implementations are
 * "simplified", i.e. they are fast but not as accurate as they could
 * be.  Instead of using the WGS84 model, they assume the FAI sphere.
 */

import 'package:otto/domain/entities/geo/fai_sphere.dart';
import 'package:otto/domain/entities/geo/geo_point.dart';
import 'package:otto/domain/entities/math/angle.dart';
import 'package:otto/domain/entities/math/util.dart';

Angle
earthDistance( double a) 
{
  if (a <= 0) {
    return Angle.zero();
  }

  return Angle.acos(1 - 2 * a);
}

/// Calculates the distance and bearing of two locations
/// @param loc1 Location 1
/// @param loc2 Location 2
/// @param Distance Pointer to the distance variable
/// @param Bearing Pointer to the bearing variable

(Angle distanceAngle, Angle bearing) distanceBearingS(GeoPoint loc1, GeoPoint loc2   ) {
  assert(loc1.isValid());
  assert(loc2.isValid());

  final (sinLat1,cosLat1) = loc1.latitude.sinCos();

  final (sinLat2,cosLat2) = loc2.latitude.sinCos();



  const Angle dlon = loc2.longitude - loc1.longitude;


    final s1 = (loc2.latitude - loc1.latitude).accurateHalfSin();
    final s2 = dlon.accurateHalfSin();
    final a = square(s1) + cosLat1 * cosLat2 * square(s2);

    Angle distance = earthDistance(a);
    assert(!distance.isNegative());



  
    final(sinDlon,cosDlon) = dlon.sinCos();
   

    final y = sinDlon * cosLat2;
    final x = cosLat1 * sinLat2 - sinLat1 * cosLat2 * cosDlon;

 

      return (distance,(x == 0 && y == 0)
      ? Angle.zero()
      : Angle.fromXY(x, y).asBearing());
  }


Angle distanceBearingS(GeoPoint loc1, GeoPoint loc2,   Angle bearing) {

   final Angle distanceAngle =  distanceBearingS(loc1, loc2, bearing);
    return angleToEarthDistance(distanceAngle);
}

/// @see FindLatitudeLongitude()

GeoPoint
findLatitudeLongitudeS(GeoPoint loc,
                       Angle bearing, double distance) {
  assert(loc.isValid());
  assert(distance >= 0);

  if (distance <= 0) {
    return loc;
  }

   Angle distanceAngle = earthDistanceToAngle(distance);

  final (sinDistance,cosDistance) = distanceAngle.sinCos();


  final (sinBearing,cosBearing) = bearing.sinCos();


  final (sinLatitude,cosLatitude) = loc.latitude.sinCos();


  Angle locOutLatitude = Angle.asin(sinLatitude * cosDistance
                                 + cosLatitude * sinDistance * cosBearing);

  Angle locOutLongitude = loc.longitude +
    Angle.fromXY(cosDistance - sinLatitude * locOutLatitude.latitude.sin(),
                  sinBearing * sinDistance * cosLatitude);

  return GeoPoint(latitude: locOutLatitude, longitude: locOutLongitude).normalize();// ensure longitude is within -180:180
}

/// @see ProjectedDistance()

double
projectedDistanceS(GeoPoint loc1, GeoPoint loc2, GeoPoint loc3) {
  
 final (Angle distAd, Angle crsAd) = distanceBearingS(loc1, loc3);
  if (!distAd.isPositive()){
    /* workaround: new sine implementation may return small non-zero
       values for sin(0) */
    return 0;
  }

 final  (Angle distAb, Angle crsAb)=
  distanceBearingS(loc1, loc2);
  if (!distAb.isPositive()){
    /* workaround: new sine implementation may return small non-zero
       values for sin(0) */
    return 0;
  }

  // The "along track distance", along_track_distance, the distance from A along the
  // course towards B to the point abeam D

  final sindistAd = distAd.sin();
  final crossTrackDistance =
    Angle.asin(sindistAd * (crsAd - crsAb).sin());

  final (double sinXTD,double cosXTD) = crossTrackDistance.sinCos();


  // along track distance
   Angle alongTrackDistance =
    Angle.asin(cathetus(sindistAd, sinXTD) / cosXTD);

  return angleToEarthDistance(alongTrackDistance);
}