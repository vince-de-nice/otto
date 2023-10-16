// // This file is "main.dart"
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:flutter/foundation.dart';

// // required: associates our `main.dart` with the code generated by Freezed
// part 'main.freezed.dart';
// // optional: Since our Person class is serializable, we must add this line.
// // But if Person was not serializable, we could skip it.
// part 'main.g.dart';

// @freezed
// class Person with _$Person {
//   const factory Person({
//     required String firstName,
//     required String lastName,
//     required int age,
//   }) = _Person;

//   factory Person.fromJson(Map<String, Object?> json)
//       => _$PersonFromJson(json);
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part 'acceleration.freezed.dart';

/// State of acceleration of aircraft
@freezed
class AccelerationState with _$AccelerationState {
  const factory AccelerationState(
      {
      /// Is G-load information available?
      /// @see Gload
      required bool available,

      /// Is the G-load information coming from a connected device (true) or
      /// was it calculated by XCSoar (false)
      required bool real,

      /// G-Load information of external device (if available)
      /// or estimated (assuming balanced turn)
      /// @see AccelerationAvailable
      required double gLoad}) = _AccelerationState;
}