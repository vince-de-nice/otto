import 'package:freezed_annotation/freezed_annotation.dart';
part 'dms.freezed.dart';

@freezed
class DMS with _$DMS {
  const DMS._();

  const factory DMS(
      {required int degrees,
      @Default(0) int minutes,
      @Default(0) int seconds,
      @Default(false) bool negative}) = _DMS;


  double toAbsoluteFloat() {
    return degrees + minutes / 60.0 + seconds / 3600.0;
  }

  double toFloat() {
    return negative ? -toAbsoluteFloat() : toAbsoluteFloat();
  }
}
