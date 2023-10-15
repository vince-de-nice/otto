class DMM {
  final int degrees, minutes, decimalMinutes;
  const DMM(this.degrees, this.minutes, this.decimalMinutes)
      : positive = degrees > 0;

  /// True if East, false if West.
  final bool positive;
}
