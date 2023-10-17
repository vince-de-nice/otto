// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DMS {
  int get degrees => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  int get seconds => throw _privateConstructorUsedError;
  bool get negative => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DMSCopyWith<DMS> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DMSCopyWith<$Res> {
  factory $DMSCopyWith(DMS value, $Res Function(DMS) then) =
      _$DMSCopyWithImpl<$Res, DMS>;
  @useResult
  $Res call({int degrees, int minutes, int seconds, bool negative});
}

/// @nodoc
class _$DMSCopyWithImpl<$Res, $Val extends DMS> implements $DMSCopyWith<$Res> {
  _$DMSCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? minutes = null,
    Object? seconds = null,
    Object? negative = null,
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
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      negative: null == negative
          ? _value.negative
          : negative // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DMSImplCopyWith<$Res> implements $DMSCopyWith<$Res> {
  factory _$$DMSImplCopyWith(_$DMSImpl value, $Res Function(_$DMSImpl) then) =
      __$$DMSImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int degrees, int minutes, int seconds, bool negative});
}

/// @nodoc
class __$$DMSImplCopyWithImpl<$Res> extends _$DMSCopyWithImpl<$Res, _$DMSImpl>
    implements _$$DMSImplCopyWith<$Res> {
  __$$DMSImplCopyWithImpl(_$DMSImpl _value, $Res Function(_$DMSImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? degrees = null,
    Object? minutes = null,
    Object? seconds = null,
    Object? negative = null,
  }) {
    return _then(_$DMSImpl(
      degrees: null == degrees
          ? _value.degrees
          : degrees // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      seconds: null == seconds
          ? _value.seconds
          : seconds // ignore: cast_nullable_to_non_nullable
              as int,
      negative: null == negative
          ? _value.negative
          : negative // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DMSImpl extends _DMS {
  const _$DMSImpl(
      {required this.degrees,
      this.minutes = 0,
      this.seconds = 0,
      this.negative = false})
      : super._();

  @override
  final int degrees;
  @override
  @JsonKey()
  final int minutes;
  @override
  @JsonKey()
  final int seconds;
  @override
  @JsonKey()
  final bool negative;

  @override
  String toString() {
    return 'DMS(degrees: $degrees, minutes: $minutes, seconds: $seconds, negative: $negative)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DMSImpl &&
            (identical(other.degrees, degrees) || other.degrees == degrees) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.seconds, seconds) || other.seconds == seconds) &&
            (identical(other.negative, negative) ||
                other.negative == negative));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, degrees, minutes, seconds, negative);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DMSImplCopyWith<_$DMSImpl> get copyWith =>
      __$$DMSImplCopyWithImpl<_$DMSImpl>(this, _$identity);
}

abstract class _DMS extends DMS {
  const factory _DMS(
      {required final int degrees,
      final int minutes,
      final int seconds,
      final bool negative}) = _$DMSImpl;
  const _DMS._() : super._();

  @override
  int get degrees;
  @override
  int get minutes;
  @override
  int get seconds;
  @override
  bool get negative;
  @override
  @JsonKey(ignore: true)
  _$$DMSImplCopyWith<_$DMSImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
