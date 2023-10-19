// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "util/TrivialArray.hxx"

// #include <cstdint>
import 'package:freezed_annotation/freezed_annotation.dart';
part 'igc_extensions.freezed.dart';

@freezed
class IGCExtension with _$IGCExtension {
  const IGCExtension._();
  const factory IGCExtension({
    required int start,
    required int finish,
    required String code, //[4];
  }) = _IGCExtension;
}

class IGCExtensions {
  final Iterable<IGCExtension> extensions = Iterable<IGCExtension>.generate(
      16, (_) => const IGCExtension(start: 0, finish: 0, code: ""));
}
