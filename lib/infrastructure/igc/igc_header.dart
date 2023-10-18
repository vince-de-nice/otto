// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'igc_header.freezed.dart';

@freezed
class IGCHeader with _$IGCHeader {
  IGCHeader._();
  const factory IGCHeader(
      {
      /// 3-letter manufacturer id.
      required String manufacturer,

      /// 3-letter logger id.
      required String id,

      /// The flight number on that day.
      @Default(0) int flight}) = _IGCHeader;
}
