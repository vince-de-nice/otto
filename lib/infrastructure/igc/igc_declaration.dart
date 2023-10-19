// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "time/BrokenDateTime.hpp"
// #include "util/StaticString.hxx"
// #include "Geo/GeoPoint.hpp"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otto/domain/entities/geo/geo_point.dart';
part 'igc_declaration.freezed.dart';

@freezed
class IGCDeclarationHeader with _$IGCDeclarationHeader {
  IGCDeclarationHeader._();

  const factory IGCDeclarationHeader(
      {
      /// Date and time of the declaration
      required DateTime datetime,

      /// Date of the flight
      required DateTime flightDate,

      //TODO: ensure the taskId length is ok
      /// Task number on the day
      required String taskId, //char task_id[4]

      /// Number of task turnpoints, excluding start and finish
      required int numTurnpoints,

      /// Optional name of the task
      String? taskName //NarrowString<256>
      }) = _IGCDeclarationHeader;

   String get getTtaskId =>
     taskId.substring(0, taskId.length < 3 ? taskId.length : 3);
}

@freezed
class IGCDeclarationTurnpoint with _$IGCDeclarationTurnpoint {
  const IGCDeclarationTurnpoint._();

  const factory IGCDeclarationTurnpoint(
      {
      /// Location of the turnpoint
      required GeoPoint location,

      /// Optional name of the turnpoint
      String? name //NarrowString<256>
      }) = _IGCDeclarationTurnpoint;
}
