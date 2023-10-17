import 'package:otto/math/angle.dart';

/// A container holding the aircraft current attitude state.
class AttitudeState {
  AttitudeState(
      {required this.heading,
      required this.bankAngle,
      required this.pitchAngle});

  /// Estimated bank angle */
  final Angle bankAngle;

  /// Estimated pitch angle */
  final Angle pitchAngle;

  /// Estimated heading */
  final Angle heading;

  // Validity bank_angle_available;
  // Validity pitch_angle_available;
  // Validity heading_available;

  /// Invalidate all data held in this object.
  void reset() {
    // bank_angle_available.Clear();
    // pitch_angle_available.Clear();
    // heading_available.Clear();
  }
}
