class DMS {
  final int degrees, minutes, seconds;
  final bool negative;

  const DMS(this.degrees,
      {this.minutes = 0, this.seconds = 0, this.negative = false});

  double toAbsoluteFloat() {
    return degrees + minutes / 60.0 + seconds / 3600.0;
  }

  double toFloat() {
    return negative ? -toAbsoluteFloat() : toAbsoluteFloat();
  }
}
