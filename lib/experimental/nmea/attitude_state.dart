import 'package:otto/math/angle.dart';

/// A container holding the aircraft current attitude state.
class AttitudeState {
  const AttitudeState({
    required this.heading,
    required this.pitchAngle,
    required this.bankAngle,
  });

  /// Estimated bank angle
  final Angle bankAngle;

  /// Estimated pitch angle
  final Angle pitchAngle;

  /// Estimated heading
  final Angle heading;
}
