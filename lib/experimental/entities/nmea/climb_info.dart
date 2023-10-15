// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

/// Information about one thermal that was or is being climbed.
class OneClimbInfo {
  OneClimbInfo(
      {required this.liftRate,
      required this.startTime,
      required this.endTime,
      this.gain = 0,
      this.startAltitude = 0,
      this.duration = Duration.zero});

  /// Time when circling started.
  DateTime startTime;

  /// Time when circling ended
  /// (or current time stamp if circling has not ended yet).
  DateTime endTime;

  /// Time spent in this thermal [s].
  Duration duration;

  /// Altitude gained while in the thermal [m]. May be negative.
  double gain;

  /// Start altitude [m] */
  double startAltitude;

  /// Average vertical speed in the thermal [m/s]. May be negative.
  double liftRate;

  void clear() {
    gain = 0;
    liftRate = 0;
    startAltitude = 0;
  }

  bool isDefined() {
    return duration > Duration.zero;
  }

  void calculateDuration() {
    duration = endTime.difference(startTime);
  }

  void calculateLiftRate() {
    liftRate = isDefined() ? gain / duration.inSeconds : 0;
  }

  void calculateAll() {
    calculateDuration();
    calculateLiftRate();
  }
}

/// Derived climb data
class ClimbInfo {
  const ClimbInfo(
      this.currentThermal, this.lastThermal, this.lastThermalAverageSmooth);
  final OneClimbInfo currentThermal;

  final OneClimbInfo lastThermal;

  /// Average vertical speed in the last thermals smoothed by low-pass-filter
  final double lastThermalAverageSmooth;

  void clear() {
    currentThermal.clear();
    lastThermal.clear();
  }
}
