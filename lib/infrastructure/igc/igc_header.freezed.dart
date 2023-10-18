// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'igc_header.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IGCHeader {
  /// 3-letter manufacturer id.
  String get manufacturer => throw _privateConstructorUsedError;

  /// 3-letter logger id.
  String get id => throw _privateConstructorUsedError;

  /// The flight number on that day.
  int get flight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IGCHeaderCopyWith<IGCHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IGCHeaderCopyWith<$Res> {
  factory $IGCHeaderCopyWith(IGCHeader value, $Res Function(IGCHeader) then) =
      _$IGCHeaderCopyWithImpl<$Res, IGCHeader>;
  @useResult
  $Res call({String manufacturer, String id, int flight});
}

/// @nodoc
class _$IGCHeaderCopyWithImpl<$Res, $Val extends IGCHeader>
    implements $IGCHeaderCopyWith<$Res> {
  _$IGCHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
    Object? id = null,
    Object? flight = null,
  }) {
    return _then(_value.copyWith(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flight: null == flight
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IGCHeaderImplCopyWith<$Res>
    implements $IGCHeaderCopyWith<$Res> {
  factory _$$IGCHeaderImplCopyWith(
          _$IGCHeaderImpl value, $Res Function(_$IGCHeaderImpl) then) =
      __$$IGCHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String manufacturer, String id, int flight});
}

/// @nodoc
class __$$IGCHeaderImplCopyWithImpl<$Res>
    extends _$IGCHeaderCopyWithImpl<$Res, _$IGCHeaderImpl>
    implements _$$IGCHeaderImplCopyWith<$Res> {
  __$$IGCHeaderImplCopyWithImpl(
      _$IGCHeaderImpl _value, $Res Function(_$IGCHeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufacturer = null,
    Object? id = null,
    Object? flight = null,
  }) {
    return _then(_$IGCHeaderImpl(
      manufacturer: null == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      flight: null == flight
          ? _value.flight
          : flight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IGCHeaderImpl extends _IGCHeader with DiagnosticableTreeMixin {
  const _$IGCHeaderImpl(
      {required this.manufacturer, required this.id, this.flight = 0})
      : super._();

  /// 3-letter manufacturer id.
  @override
  final String manufacturer;

  /// 3-letter logger id.
  @override
  final String id;

  /// The flight number on that day.
  @override
  @JsonKey()
  final int flight;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IGCHeader(manufacturer: $manufacturer, id: $id, flight: $flight)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IGCHeader'))
      ..add(DiagnosticsProperty('manufacturer', manufacturer))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('flight', flight));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IGCHeaderImpl &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.flight, flight) || other.flight == flight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, manufacturer, id, flight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IGCHeaderImplCopyWith<_$IGCHeaderImpl> get copyWith =>
      __$$IGCHeaderImplCopyWithImpl<_$IGCHeaderImpl>(this, _$identity);
}

abstract class _IGCHeader extends IGCHeader {
  const factory _IGCHeader(
      {required final String manufacturer,
      required final String id,
      final int flight}) = _$IGCHeaderImpl;
  const _IGCHeader._() : super._();

  @override

  /// 3-letter manufacturer id.
  String get manufacturer;
  @override

  /// 3-letter logger id.
  String get id;
  @override

  /// The flight number on that day.
  int get flight;
  @override
  @JsonKey(ignore: true)
  _$$IGCHeaderImplCopyWith<_$IGCHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
