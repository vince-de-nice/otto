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

  final sc1 = loc1.latitude.sinCos();
  final sin_lat1 = sc1.first, cos_lat1 = sc1.second;
  final sc2 = loc2.latitude.sinCos();
  final sin_lat2 = sc2.first, cos_lat2 = sc2.second;

  const Angle dlon = loc2.longitude - loc1.longitude;

  if (distance != 0) {
    final s1 = (loc2.latitude - loc1.latitude).accurateHalfSin();
    final s2 = dlon.accurate_half_sin();
    final a = square(s1) + cos_lat1 * cos_lat2 * square(s2);

    Angle distance2 = earthDistance(a);
    assert(!distance2.isNegative());
    *distance = distance2;
  }

  if (bearing) {
    final sc = dlon.sinCos();
    final sin_dlon = sc.first, cos_dlon = sc.second;

    final y = sin_dlon * cos_lat2;
    final x = cos_lat1 * sin_lat2 - sin_lat1 * cos_lat2 * cos_dlon;

    *bearing = (x == 0 && y == 0)
      ? Angle.zero()
      : Angle.fromXY(x, y).asBearing();
  }
}

Angle
distanceBearingS(GeoPoint loc1, GeoPoint loc2,
                  Angle bearing) {

   final Angle distance_angle =  distanceBearingS(loc1, loc2, bearing);
    return angleToEarthDistance(distance_angle);
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

  final scd = distanceAngle.sinCos();
  final sin_distance = scd.first, cos_distance = scd.second;

  final scb = bearing.sinCos();
  final sin_bearing = scb.first, cos_bearing = scb.second;

  final scl = loc.latitude.sinCos();
  final sin_latitude = scl.first, cos_latitude = scl.second;

  GeoPoint loc_out;
  loc_out.latitude = Angle.asin(sin_latitude * cos_distance
                                 + cos_latitude * sin_distance * cos_bearing);

  loc_out.longitude = loc.longitude +
    Angle.fromXY(cos_distance - sin_latitude * loc_out.latitude.sin(),
                  sin_bearing * sin_distance * cos_latitude);

  return loc_out.normalize();// ensure longitude is within -180:180
}

/// @see ProjectedDistance()

double
projectedDistanceS(GeoPoint loc1, GeoPoint loc2,
                   GeoPoint loc3) {
  Angle dist_AD, crs_AD;
 distanceBearingS(loc1, loc3, &dist_AD, &crs_AD);
  if (!dist_AD.isPositive()){
    /* workaround: new sine implementation may return small non-zero
       values for sin(0) */
    return 0;
  }

  Angle dist_AB, crs_AB;
  distanceBearingS(loc1, loc2, &dist_AB, &crs_AB);
  if (!dist_AB.isPositive()){
    /* workaround: new sine implementation may return small non-zero
       values for sin(0) */
    return 0;
  }

  // The "along track distance", along_track_distance, the distance from A along the
  // course towards B to the point abeam D

  final sindist_AD = dist_AD.sin();
  final cross_track_distance =
    Angle.asin(sindist_AD * (crs_AD - crs_AB).sin());

  final sc = cross_track_distance.sinCos();
  final sinXTD = sc.first, cosXTD = sc.second;

  // along track distance
   Angle along_track_distance =
    Angle.asin(cathetus(sindist_AD, sinXTD) / cosXTD);

  return angleToEarthDistance(along_track_distance);
}