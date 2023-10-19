// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'igc_extensions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IGCExtension {
  int get start => throw _privateConstructorUsedError;
  int get finish => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IGCExtensionCopyWith<IGCExtension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IGCExtensionCopyWith<$Res> {
  factory $IGCExtensionCopyWith(
          IGCExtension value, $Res Function(IGCExtension) then) =
      _$IGCExtensionCopyWithImpl<$Res, IGCExtension>;
  @useResult
  $Res call({int start, int finish, String code});
}

/// @nodoc
class _$IGCExtensionCopyWithImpl<$Res, $Val extends IGCExtension>
    implements $IGCExtensionCopyWith<$Res> {
  _$IGCExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? finish = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IGCExtensionImplCopyWith<$Res>
    implements $IGCExtensionCopyWith<$Res> {
  factory _$$IGCExtensionImplCopyWith(
          _$IGCExtensionImpl value, $Res Function(_$IGCExtensionImpl) then) =
      __$$IGCExtensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int start, int finish, String code});
}

/// @nodoc
class __$$IGCExtensionImplCopyWithImpl<$Res>
    extends _$IGCExtensionCopyWithImpl<$Res, _$IGCExtensionImpl>
    implements _$$IGCExtensionImplCopyWith<$Res> {
  __$$IGCExtensionImplCopyWithImpl(
      _$IGCExtensionImpl _value, $Res Function(_$IGCExtensionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? finish = null,
    Object? code = null,
  }) {
    return _then(_$IGCExtensionImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$IGCExtensionImpl extends _IGCExtension {
  const _$IGCExtensionImpl(
      {required this.start, required this.finish, required this.code})
      : super._();

  @override
  final int start;
  @override
  final int finish;
  @override
  final String code;

  @override
  String toString() {
    return 'IGCExtension(start: $start, finish: $finish, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IGCExtensionImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.finish, finish) || other.finish == finish) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, finish, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IGCExtensionImplCopyWith<_$IGCExtensionImpl> get copyWith =>
      __$$IGCExtensionImplCopyWithImpl<_$IGCExtensionImpl>(this, _$identity);
}

abstract class _IGCExtension extends IGCExtension {
  const factory _IGCExtension(
      {required final int start,
      required final int finish,
      required final String code}) = _$IGCExtensionImpl;
  const _IGCExtension._() : super._();

  @override
  int get start;
  @override
  int get finish;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$IGCExtensionImplCopyWith<_$IGCExtensionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
