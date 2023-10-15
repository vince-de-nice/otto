// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'acceleration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccelerationState {
  /// Is G-load information available?
  /// @see Gload
  bool get available => throw _privateConstructorUsedError;

  /// Is the G-load information coming from a connected device (true) or
  /// was it calculated by XCSoar (false)
  bool get real => throw _privateConstructorUsedError;

  /// G-Load information of external device (if available)
  /// or estimated (assuming balanced turn)
  /// @see AccelerationAvailable
  double get gLoad => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccelerationStateCopyWith<AccelerationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccelerationStateCopyWith<$Res> {
  factory $AccelerationStateCopyWith(
          AccelerationState value, $Res Function(AccelerationState) then) =
      _$AccelerationStateCopyWithImpl<$Res, AccelerationState>;
  @useResult
  $Res call({bool available, bool real, double gLoad});
}

/// @nodoc
class _$AccelerationStateCopyWithImpl<$Res, $Val extends AccelerationState>
    implements $AccelerationStateCopyWith<$Res> {
  _$AccelerationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? real = null,
    Object? gLoad = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      real: null == real
          ? _value.real
          : real // ignore: cast_nullable_to_non_nullable
              as bool,
      gLoad: null == gLoad
          ? _value.gLoad
          : gLoad // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccelerationStateImplCopyWith<$Res>
    implements $AccelerationStateCopyWith<$Res> {
  factory _$$AccelerationStateImplCopyWith(_$AccelerationStateImpl value,
          $Res Function(_$AccelerationStateImpl) then) =
      __$$AccelerationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool available, bool real, double gLoad});
}

/// @nodoc
class __$$AccelerationStateImplCopyWithImpl<$Res>
    extends _$AccelerationStateCopyWithImpl<$Res, _$AccelerationStateImpl>
    implements _$$AccelerationStateImplCopyWith<$Res> {
  __$$AccelerationStateImplCopyWithImpl(_$AccelerationStateImpl _value,
      $Res Function(_$AccelerationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? real = null,
    Object? gLoad = null,
  }) {
    return _then(_$AccelerationStateImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      real: null == real
          ? _value.real
          : real // ignore: cast_nullable_to_non_nullable
              as bool,
      gLoad: null == gLoad
          ? _value.gLoad
          : gLoad // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AccelerationStateImpl implements _AccelerationState {
  const _$AccelerationStateImpl(
      {required this.available, required this.real, required this.gLoad});

  /// Is G-load information available?
  /// @see Gload
  @override
  final bool available;

  /// Is the G-load information coming from a connected device (true) or
  /// was it calculated by XCSoar (false)
  @override
  final bool real;

  /// G-Load information of external device (if available)
  /// or estimated (assuming balanced turn)
  /// @see AccelerationAvailable
  @override
  final double gLoad;

  @override
  String toString() {
    return 'AccelerationState(available: $available, real: $real, gLoad: $gLoad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccelerationStateImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.real, real) || other.real == real) &&
            (identical(other.gLoad, gLoad) || other.gLoad == gLoad));
  }

  @override
  int get hashCode => Object.hash(runtimeType, available, real, gLoad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccelerationStateImplCopyWith<_$AccelerationStateImpl> get copyWith =>
      __$$AccelerationStateImplCopyWithImpl<_$AccelerationStateImpl>(
          this, _$identity);
}

abstract class _AccelerationState implements AccelerationState {
  const factory _AccelerationState(
      {required final bool available,
      required final bool real,
      required final double gLoad}) = _$AccelerationStateImpl;

  @override

  /// Is G-load information available?
  /// @see Gload
  bool get available;
  @override

  /// Is the G-load information coming from a connected device (true) or
  /// was it calculated by XCSoar (false)
  bool get real;
  @override

  /// G-Load information of external device (if available)
  /// or estimated (assuming balanced turn)
  /// @see AccelerationAvailable
  double get gLoad;
  @override
  @JsonKey(ignore: true)
  _$$AccelerationStateImplCopyWith<_$AccelerationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
