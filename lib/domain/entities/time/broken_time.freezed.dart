// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'broken_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BrokenTime {
  DateTime get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrokenTimeCopyWith<BrokenTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrokenTimeCopyWith<$Res> {
  factory $BrokenTimeCopyWith(
          BrokenTime value, $Res Function(BrokenTime) then) =
      _$BrokenTimeCopyWithImpl<$Res, BrokenTime>;
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class _$BrokenTimeCopyWithImpl<$Res, $Val extends BrokenTime>
    implements $BrokenTimeCopyWith<$Res> {
  _$BrokenTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrokenTimeImplCopyWith<$Res>
    implements $BrokenTimeCopyWith<$Res> {
  factory _$$BrokenTimeImplCopyWith(
          _$BrokenTimeImpl value, $Res Function(_$BrokenTimeImpl) then) =
      __$$BrokenTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime time});
}

/// @nodoc
class __$$BrokenTimeImplCopyWithImpl<$Res>
    extends _$BrokenTimeCopyWithImpl<$Res, _$BrokenTimeImpl>
    implements _$$BrokenTimeImplCopyWith<$Res> {
  __$$BrokenTimeImplCopyWithImpl(
      _$BrokenTimeImpl _value, $Res Function(_$BrokenTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
  }) {
    return _then(_$BrokenTimeImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$BrokenTimeImpl extends _BrokenTime {
  const _$BrokenTimeImpl({required this.time}) : super._();

  @override
  final DateTime time;

  @override
  String toString() {
    return 'BrokenTime(time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrokenTimeImpl &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrokenTimeImplCopyWith<_$BrokenTimeImpl> get copyWith =>
      __$$BrokenTimeImplCopyWithImpl<_$BrokenTimeImpl>(this, _$identity);
}

abstract class _BrokenTime extends BrokenTime {
  const factory _BrokenTime({required final DateTime time}) = _$BrokenTimeImpl;
  const _BrokenTime._() : super._();

  @override
  DateTime get time;
  @override
  @JsonKey(ignore: true)
  _$$BrokenTimeImplCopyWith<_$BrokenTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
