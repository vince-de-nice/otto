// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

/// State of acceleration of aircraft
class AccelerationState {
  const AccelerationState(
      {required this.available, required this.gLoad, required this.real});

  /// Is G-load information available?
  /// @see Gload
  final bool available;

  /// Is the G-load information coming from a connected device (true) or
  /// was it calculated by XCSoar (false)
  final bool real;

  /// G-Load information of external device (if available)
  /// or estimated (assuming balanced turn)
  /// @see AccelerationAvailable
  final double gLoad;
}
