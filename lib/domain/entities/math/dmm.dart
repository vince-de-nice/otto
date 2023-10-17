import 'package:freezed_annotation/freezed_annotation.dart';
part 'dmm.freezed.dart';

@freezed
class DMM with _$DMM {
  const DMM._();

  const factory DMM(
      {required int degrees,
      @Default(0) int minutes,
      @Default(0) int decimalMinutes}) = _DMM;
}
