import 'lift_database.dart';

class VarioInfo {
  const VarioInfo(
      {required this.average,
      required this.averageGr,
      required this.cruiseGr,
      required this.gr,
      required this.ldVario,
      required this.liftDatabase,
      required this.nettoAverage,
      required this.sinkRate});
  final double sinkRate;

  /// Average vertical speed based on 30s
  final double average;

  /// Average vertical speed of the airmass based on 30s/
  final double nettoAverage;

  /// Instant glide ratio over ground
  final double gr;

  /// Glide ratio over ground while in Cruise mode
  final double cruiseGr;

  /// Average glide ratio over ground.  Zero means the value is not available.
  final double averageGr;

  /// Instant lift/drag ratio
  final double ldVario;

  /// The lift of each ten degrees while circling.
  /// Index 1 equals 5 to 15 degrees.
  final LiftDatabase liftDatabase;
}
