// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atmospheric_pressure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AtmosphericPressure {
  double get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AtmosphericPressureCopyWith<AtmosphericPressure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtmosphericPressureCopyWith<$Res> {
  factory $AtmosphericPressureCopyWith(
          AtmosphericPressure value, $Res Function(AtmosphericPressure) then) =
      _$AtmosphericPressureCopyWithImpl<$Res, AtmosphericPressure>;
  @useResult
  $Res call({double value});
}

/// @nodoc
class _$AtmosphericPressureCopyWithImpl<$Res, $Val extends AtmosphericPressure>
    implements $AtmosphericPressureCopyWith<$Res> {
  _$AtmosphericPressureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtmosphericPressureImplCopyWith<$Res>
    implements $AtmosphericPressureCopyWith<$Res> {
  factory _$$AtmosphericPressureImplCopyWith(_$AtmosphericPressureImpl value,
          $Res Function(_$AtmosphericPressureImpl) then) =
      __$$AtmosphericPressureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value});
}

/// @nodoc
class __$$AtmosphericPressureImplCopyWithImpl<$Res>
    extends _$AtmosphericPressureCopyWithImpl<$Res, _$AtmosphericPressureImpl>
    implements _$$AtmosphericPressureImplCopyWith<$Res> {
  __$$AtmosphericPressureImplCopyWithImpl(_$AtmosphericPressureImpl _value,
      $Res Function(_$AtmosphericPressureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AtmosphericPressureImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AtmosphericPressureImpl implements _AtmosphericPressure {
  const _$AtmosphericPressureImpl({required this.value});

  @override
  final double value;

  @override
  String toString() {
    return 'AtmosphericPressure(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtmosphericPressureImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtmosphericPressureImplCopyWith<_$AtmosphericPressureImpl> get copyWith =>
      __$$AtmosphericPressureImplCopyWithImpl<_$AtmosphericPressureImpl>(
          this, _$identity);
}

abstract class _AtmosphericPressure implements AtmosphericPressure {
  const factory _AtmosphericPressure({required final double value}) =
      _$AtmosphericPressureImpl;

  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$AtmosphericPressureImplCopyWith<_$AtmosphericPressureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
