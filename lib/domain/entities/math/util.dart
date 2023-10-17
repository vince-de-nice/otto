// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'dart:math';

square<T extends num>(T a) {
  return a * a;
}

cubic<T extends num>(T a) {
  return a * a * a;
}

/// Calculate the length of the second cathetus, given the length of
/// the hypotenuse and the first cathetus.
double cathetus(double hypotenuse, double cathetus1) {
  return sqrt(square(hypotenuse) - square(cathetus1));
}

/// Calculate the length of the space diagonal of the given cuboid.
double spaceDiagonal(double a, double b, double c) {
  return sqrt(square(a) + square(b) + square(c));
}

/// Implementation of a sigmoid function with a result range of [-1..1].
double sigmoid(double x) {
  return 2.0 / (1.0 + exp(-x)) - 1.0;
}
