class ClimbHistory {
  /// Store vario history from 0 to 360 kph.
  static const int size = 100;

  /// Average climb rate for each episode */
  final List<double> vario = List.filled(size, 0, growable: false);

  /// Number of samples in each episode */
  final List<int> count = List.filled(size, 0, growable: false);

  void clear() {
    vario.fillRange(0, count.length - 1, 0);
    count.fillRange(0, count.length - 1, 0);
  }

  void add(int speed, double newVario) {
    if (speed >= count.length) return;

    if (count[speed] >= 0x8000) {
      /* prevent integer overflow */
      vario[speed] = vario.elementAt(speed) / 2;
      count[speed] = count.elementAt(speed) ~/ 2;
    }

    vario[speed] += newVario;
    ++count[speed];
  }

  /// Do we have data for the specified speed?
  bool check(int speed) {
    return speed < count.length && count[speed] > 0;
  }

  /// Returns the average climb rate for the specified speed.
  double get(int speed) {
    assert(speed < vario.length);
    assert(count[speed] > 0);

    return vario[speed] / count[speed];
  }
}
