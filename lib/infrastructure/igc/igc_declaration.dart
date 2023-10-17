// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "time/BrokenDateTime.hpp"
// #include "util/StaticString.hxx"
// #include "Geo/GeoPoint.hpp"
import 'package:freezed_annotation/freezed_annotation.dart';
part 'igc_declaration.freezed.dart';

@freezed
class IGCDeclarationHeader with _$IGCDeclarationHeader {

  IGCDeclarationHeader._();

   const factory IGCDeclarationHeader({
  /// Date and time of the declaration
  required DateTime datetime,

  /// Date of the flight
  required DateTime flightDate,

  /// Task number on the day
  required String taskId, //char task_id[4]


  /// Number of task turnpoints, excluding start and finish
  required int numTurnpoints,

  /// Optional name of the task
  String? taskName //NarrowString<256>
  }) =_IGCDeclarationHeader;

    // String get taskId =>
    //   _taskId.substring(0, _taskId.length < 3 ? _taskId.length : 3);
}

@freezed
class IGCDeclarationTurnpoint with _$IGCDeclarationTurnpoint {
IGCDeclarationTurnpoint._();

  const factory IGCDeclarationHeader({
  /// Location of the turnpoint
  required GeoPoint location,

  /// Optional name of the turnpoint
  String? name //NarrowString<256>
  }) = _IGCDeclarationTurnpoint;

}