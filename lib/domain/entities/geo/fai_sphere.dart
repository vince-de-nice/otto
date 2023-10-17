// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

/*! @file
 * @brief Library for calculating Earth dimensions on the FAI sphere
 */

import 'package:otto/domain/entities/math/angle.dart';

const int rearth = 6371000;

/// Convert a distance on earth's surface [m] to the according Angle,
/// assuming the earth is a sphere.
Angle earthDistanceToAngle(double distance) {
  return Angle.radians(distance / rearth);
}

/// Convert an angle to the according distance on earth's surface [m],
/// assuming the earth is a sphere.

double angleToEarthDistance(Angle angle) {
  return angle.radians() * rearth;
}
