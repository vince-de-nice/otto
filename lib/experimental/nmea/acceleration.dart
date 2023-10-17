/// State of acceleration of aircraft
class AccelerationState {
  AccelerationState(this.available, this.gLoad, this.real);

  /// Is G-load information available?
  /// @see Gload
  bool available;

  /// Is the G-load information coming from a connected device (true) or
  /// was it calculated by XCSoar (false)
  bool real;

  /// G-Load information of external device (if available)
  /// or estimated (assuming balanced turn)
  /// @see AccelerationAvailable
  double gLoad;

  void reset() {
    available = false;
  }

  void provideGLoad({required double gLoad, bool real = true}) {
    gLoad = gLoad;
    real = real;
    available = true;
  }

  /// Adds data from the specified object, unless already present in
  /// this one.
  void complement(AccelerationState add) {
    if (add.available && (!available || (add.real && !real))) {
      real = add.real;
      gLoad = add.gLoad;
      available = add.available;
    }
  }
}
