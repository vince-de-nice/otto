// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dmm.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DMM {
  int get degrees => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  int get decimalMinutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DMMCopyWith<DMM> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMMCopyWith<$Res> {
  factory $DMMCopyWith(DMM value, $Res Function(DMM) then) =
      _$DMMCopyWithImpl<$Res, DMM>;
  @useResult
  $Res call({int degrees, int minutes, int decimalMinutes});
}

/// @nodoc
class _$DMMCopyWithImpl<$Res, $Val extends DMM> implements $DMMCopyWith<$Res> {
  _$DMMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? minutes = null,
    Object? decimalMinutes = null,
  }) {
    return _then(_value.copyWith(
      degrees: null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      decimalMinutes: null == decimalMinutes
          ? _value.decimalMinutes
          : decimalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DMMImplCopyWith<$Res> implements $DMMCopyWith<$Res> {
  factory _$$DMMImplCopyWith(_$DMMImpl value, $Res Function(_$DMMImpl) then) =
      __$$DMMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int degrees, int minutes, int decimalMinutes});
}

/// @nodoc
class __$$DMMImplCopyWithImpl<$Res> extends _$DMMCopyWithImpl<$Res, _$DMMImpl>
    implements _$$DMMImplCopyWith<$Res> {
  __$$DMMImplCopyWithImpl(_$DMMImpl _value, $Res Function(_$DMMImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? minutes = null,
    Object? decimalMinutes = null,
  }) {
    return _then(_$DMMImpl(
      degrees: null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      decimalMinutes: null == decimalMinutes
          ? _value.decimalMinutes
          : decimalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DMMImpl extends _DMM {
  const _$DMMImpl(
      {required this.degrees, this.minutes = 0, this.decimalMinutes = 0})
      : super._();

  @override
  final int degrees;
  @override
  @JsonKey()
  final int minutes;
  @override
  @JsonKey()
  final int decimalMinutes;

  @override
  String toString() {
    return 'DMM(degrees: $degrees, minutes: $minutes, decimalMinutes: $decimalMinutes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DMMImpl &&
            (identical(other.degrees, degrees) || other.degrees == degrees) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.decimalMinutes, decimalMinutes) ||
                other.decimalMinutes == decimalMinutes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, degrees, minutes, decimalMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DMMImplCopyWith<_$DMMImpl> get copyWith =>
      __$$DMMImplCopyWithImpl<_$DMMImpl>(this, _$identity);
}

abstract class _DMM extends DMM {
  const factory _DMM(
      {required final int degrees,
      final int minutes,
      final int decimalMinutes}) = _$DMMImpl;
  const _DMM._() : super._();

  @override
  int get degrees;
  @override
  int get minutes;
  @override
  int get decimalMinutes;
  @override
  @JsonKey(ignore: true)
  _$$DMMImplCopyWith<_$DMMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
