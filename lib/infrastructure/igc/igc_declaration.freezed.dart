// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'igc_declaration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IGCDeclarationHeader {
  /// Date and time of the declaration
  DateTime get datetime => throw _privateConstructorUsedError;

  /// Date of the flight
  DateTime get flightDate =>
      throw _privateConstructorUsedError; //TODO: ensure the taskId length is ok
  /// Task number on the day
  String get taskId => throw _privateConstructorUsedError; //char task_id[4]
  /// Number of task turnpoints, excluding start and finish
  int get numTurnpoints => throw _privateConstructorUsedError;

  /// Optional name of the task
  String? get taskName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IGCDeclarationHeaderCopyWith<IGCDeclarationHeader> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IGCDeclarationHeaderCopyWith<$Res> {
  factory $IGCDeclarationHeaderCopyWith(IGCDeclarationHeader value,
          $Res Function(IGCDeclarationHeader) then) =
      _$IGCDeclarationHeaderCopyWithImpl<$Res, IGCDeclarationHeader>;
  @useResult
  $Res call(
      {DateTime datetime,
      DateTime flightDate,
      String taskId,
      int numTurnpoints,
      String? taskName});
}

/// @nodoc
class _$IGCDeclarationHeaderCopyWithImpl<$Res,
        $Val extends IGCDeclarationHeader>
    implements $IGCDeclarationHeaderCopyWith<$Res> {
  _$IGCDeclarationHeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? flightDate = null,
    Object? taskId = null,
    Object? numTurnpoints = null,
    Object? taskName = freezed,
  }) {
    return _then(_value.copyWith(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      numTurnpoints: null == numTurnpoints
          ? _value.numTurnpoints
          : numTurnpoints // ignore: cast_nullable_to_non_nullable
              as int,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IGCDeclarationHeaderImplCopyWith<$Res>
    implements $IGCDeclarationHeaderCopyWith<$Res> {
  factory _$$IGCDeclarationHeaderImplCopyWith(_$IGCDeclarationHeaderImpl value,
          $Res Function(_$IGCDeclarationHeaderImpl) then) =
      __$$IGCDeclarationHeaderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime datetime,
      DateTime flightDate,
      String taskId,
      int numTurnpoints,
      String? taskName});
}

/// @nodoc
class __$$IGCDeclarationHeaderImplCopyWithImpl<$Res>
    extends _$IGCDeclarationHeaderCopyWithImpl<$Res, _$IGCDeclarationHeaderImpl>
    implements _$$IGCDeclarationHeaderImplCopyWith<$Res> {
  __$$IGCDeclarationHeaderImplCopyWithImpl(_$IGCDeclarationHeaderImpl _value,
      $Res Function(_$IGCDeclarationHeaderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datetime = null,
    Object? flightDate = null,
    Object? taskId = null,
    Object? numTurnpoints = null,
    Object? taskName = freezed,
  }) {
    return _then(_$IGCDeclarationHeaderImpl(
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      numTurnpoints: null == numTurnpoints
          ? _value.numTurnpoints
          : numTurnpoints // ignore: cast_nullable_to_non_nullable
              as int,
      taskName: freezed == taskName
          ? _value.taskName
          : taskName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IGCDeclarationHeaderImpl extends _IGCDeclarationHeader {
  const _$IGCDeclarationHeaderImpl(
      {required this.datetime,
      required this.flightDate,
      required this.taskId,
      required this.numTurnpoints,
      this.taskName})
      : super._();

  /// Date and time of the declaration
  @override
  final DateTime datetime;

  /// Date of the flight
  @override
  final DateTime flightDate;
//TODO: ensure the taskId length is ok
  /// Task number on the day
  @override
  final String taskId;
//char task_id[4]
  /// Number of task turnpoints, excluding start and finish
  @override
  final int numTurnpoints;

  /// Optional name of the task
  @override
  final String? taskName;

  @override
  String toString() {
    return 'IGCDeclarationHeader(datetime: $datetime, flightDate: $flightDate, taskId: $taskId, numTurnpoints: $numTurnpoints, taskName: $taskName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IGCDeclarationHeaderImpl &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.flightDate, flightDate) ||
                other.flightDate == flightDate) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.numTurnpoints, numTurnpoints) ||
                other.numTurnpoints == numTurnpoints) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, datetime, flightDate, taskId, numTurnpoints, taskName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IGCDeclarationHeaderImplCopyWith<_$IGCDeclarationHeaderImpl>
      get copyWith =>
          __$$IGCDeclarationHeaderImplCopyWithImpl<_$IGCDeclarationHeaderImpl>(
              this, _$identity);
}

abstract class _IGCDeclarationHeader extends IGCDeclarationHeader {
  const factory _IGCDeclarationHeader(
      {required final DateTime datetime,
      required final DateTime flightDate,
      required final String taskId,
      required final int numTurnpoints,
      final String? taskName}) = _$IGCDeclarationHeaderImpl;
  const _IGCDeclarationHeader._() : super._();

  @override

  /// Date and time of the declaration
  DateTime get datetime;
  @override

  /// Date of the flight
  DateTime get flightDate;
  @override //TODO: ensure the taskId length is ok
  /// Task number on the day
  String get taskId;
  @override //char task_id[4]
  /// Number of task turnpoints, excluding start and finish
  int get numTurnpoints;
  @override

  /// Optional name of the task
  String? get taskName;
  @override
  @JsonKey(ignore: true)
  _$$IGCDeclarationHeaderImplCopyWith<_$IGCDeclarationHeaderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IGCDeclarationTurnpoint {
  /// Location of the turnpoint
  GeoPoint get location => throw _privateConstructorUsedError;

  /// Optional name of the turnpoint
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IGCDeclarationTurnpointCopyWith<IGCDeclarationTurnpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IGCDeclarationTurnpointCopyWith<$Res> {
  factory $IGCDeclarationTurnpointCopyWith(IGCDeclarationTurnpoint value,
          $Res Function(IGCDeclarationTurnpoint) then) =
      _$IGCDeclarationTurnpointCopyWithImpl<$Res, IGCDeclarationTurnpoint>;
  @useResult
  $Res call({GeoPoint location, String? name});

  $GeoPointCopyWith<$Res> get location;
}

/// @nodoc
class _$IGCDeclarationTurnpointCopyWithImpl<$Res,
        $Val extends IGCDeclarationTurnpoint>
    implements $IGCDeclarationTurnpointCopyWith<$Res> {
  _$IGCDeclarationTurnpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res> get location {
    return $GeoPointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IGCDeclarationTurnpointImplCopyWith<$Res>
    implements $IGCDeclarationTurnpointCopyWith<$Res> {
  factory _$$IGCDeclarationTurnpointImplCopyWith(
          _$IGCDeclarationTurnpointImpl value,
          $Res Function(_$IGCDeclarationTurnpointImpl) then) =
      __$$IGCDeclarationTurnpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeoPoint location, String? name});

  @override
  $GeoPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$IGCDeclarationTurnpointImplCopyWithImpl<$Res>
    extends _$IGCDeclarationTurnpointCopyWithImpl<$Res,
        _$IGCDeclarationTurnpointImpl>
    implements _$$IGCDeclarationTurnpointImplCopyWith<$Res> {
  __$$IGCDeclarationTurnpointImplCopyWithImpl(
      _$IGCDeclarationTurnpointImpl _value,
      $Res Function(_$IGCDeclarationTurnpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? name = freezed,
  }) {
    return _then(_$IGCDeclarationTurnpointImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IGCDeclarationTurnpointImpl extends _IGCDeclarationTurnpoint {
  const _$IGCDeclarationTurnpointImpl({required this.location, this.name})
      : super._();

  /// Location of the turnpoint
  @override
  final GeoPoint location;

  /// Optional name of the turnpoint
  @override
  final String? name;

  @override
  String toString() {
    return 'IGCDeclarationTurnpoint(location: $location, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IGCDeclarationTurnpointImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IGCDeclarationTurnpointImplCopyWith<_$IGCDeclarationTurnpointImpl>
      get copyWith => __$$IGCDeclarationTurnpointImplCopyWithImpl<
          _$IGCDeclarationTurnpointImpl>(this, _$identity);
}

abstract class _IGCDeclarationTurnpoint extends IGCDeclarationTurnpoint {
  const factory _IGCDeclarationTurnpoint(
      {required final GeoPoint location,
      final String? name}) = _$IGCDeclarationTurnpointImpl;
  const _IGCDeclarationTurnpoint._() : super._();

  @override

  /// Location of the turnpoint
  GeoPoint get location;
  @override

  /// Optional name of the turnpoint
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$IGCDeclarationTurnpointImplCopyWith<_$IGCDeclarationTurnpointImpl>
      get copyWith => throw _privateConstructorUsedError;
}
