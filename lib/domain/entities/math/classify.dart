// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

/// A constexpr wrapper for std::isfinite().  This uses the
/// non-standard __builtin_isfinite() function (specific to GCC and
/// clang) because the C++ standard library is not "constexpr".
bool isFinite<T extends num>(T value) {
  return __builtin_isfinite(value);
}
