// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'igc_fix.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IGCFix {
  BrokenTime get time => throw _privateConstructorUsedError;
  set time(BrokenTime value) => throw _privateConstructorUsedError;
  GeoPoint get location => throw _privateConstructorUsedError;
  set location(GeoPoint value) => throw _privateConstructorUsedError;
  bool get gpsValid => throw _privateConstructorUsedError;
  set gpsValid(bool value) => throw _privateConstructorUsedError;
  int get gpsAltitude => throw _privateConstructorUsedError;
  set gpsAltitude(int value) => throw _privateConstructorUsedError;
  dynamic get pressureAltitude => throw _privateConstructorUsedError;
  set pressureAltitude(dynamic value) =>
      throw _privateConstructorUsedError; /* extensions follow */
  /// Engine noise level [0 to 999].  null if undefined.
  int? get enl => throw _privateConstructorUsedError; /* extensions follow */
  /// Engine noise level [0 to 999].  null if undefined.
  set enl(int? value) => throw _privateConstructorUsedError;

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  int? get rpm => throw _privateConstructorUsedError;

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  set rpm(int? value) => throw _privateConstructorUsedError;

  /// Magnetic heading [degrees].  null if undefined.
  int? get hdm => throw _privateConstructorUsedError;

  /// Magnetic heading [degrees].  null if undefined.
  set hdm(int? value) => throw _privateConstructorUsedError;

  /// True heading [degrees].  null if undefined.
  int? get hdt => throw _privateConstructorUsedError;

  /// True heading [degrees].  null if undefined.
  set hdt(int? value) => throw _privateConstructorUsedError;

  /// Magnetic track [degrees].  null if undefined.
  int? get trm => throw _privateConstructorUsedError;

  /// Magnetic track [degrees].  null if undefined.
  set trm(int? value) => throw _privateConstructorUsedError;

  /// True track [degrees].  null if undefined.
  int? get trt => throw _privateConstructorUsedError;

  /// True track [degrees].  null if undefined.
  set trt(int? value) => throw _privateConstructorUsedError;

  /// Ground speed [km/h].  null if undefined.
  int? get gsp => throw _privateConstructorUsedError;

  /// Ground speed [km/h].  null if undefined.
  set gsp(int? value) => throw _privateConstructorUsedError;

  /// Indicated airspeed [km/h].  null if undefined.
  int? get ias => throw _privateConstructorUsedError;

  /// Indicated airspeed [km/h].  null if undefined.
  set ias(int? value) => throw _privateConstructorUsedError;

  /// True airspeed [km/h].  null if undefined.
  int? get tas => throw _privateConstructorUsedError;

  /// True airspeed [km/h].  null if undefined.
  set tas(int? value) => throw _privateConstructorUsedError;

  /// Satellites in use.  null if undefined.
  int? get siu => throw _privateConstructorUsedError;

  /// Satellites in use.  null if undefined.
  set siu(int? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IGCFixCopyWith<IGCFix> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IGCFixCopyWith<$Res> {
  factory $IGCFixCopyWith(IGCFix value, $Res Function(IGCFix) then) =
      _$IGCFixCopyWithImpl<$Res, IGCFix>;
  @useResult
  $Res call(
      {BrokenTime time,
      GeoPoint location,
      bool gpsValid,
      int gpsAltitude,
      dynamic pressureAltitude,
      int? enl,
      int? rpm,
      int? hdm,
      int? hdt,
      int? trm,
      int? trt,
      int? gsp,
      int? ias,
      int? tas,
      int? siu});

  $BrokenTimeCopyWith<$Res> get time;
  $GeoPointCopyWith<$Res> get location;
}

/// @nodoc
class _$IGCFixCopyWithImpl<$Res, $Val extends IGCFix>
    implements $IGCFixCopyWith<$Res> {
  _$IGCFixCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? location = null,
    Object? gpsValid = null,
    Object? gpsAltitude = null,
    Object? pressureAltitude = freezed,
    Object? enl = freezed,
    Object? rpm = freezed,
    Object? hdm = freezed,
    Object? hdt = freezed,
    Object? trm = freezed,
    Object? trt = freezed,
    Object? gsp = freezed,
    Object? ias = freezed,
    Object? tas = freezed,
    Object? siu = freezed,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as BrokenTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      gpsValid: null == gpsValid
          ? _value.gpsValid
          : gpsValid // ignore: cast_nullable_to_non_nullable
              as bool,
      gpsAltitude: null == gpsAltitude
          ? _value.gpsAltitude
          : gpsAltitude // ignore: cast_nullable_to_non_nullable
              as int,
      pressureAltitude: freezed == pressureAltitude
          ? _value.pressureAltitude
          : pressureAltitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enl: freezed == enl
          ? _value.enl
          : enl // ignore: cast_nullable_to_non_nullable
              as int?,
      rpm: freezed == rpm
          ? _value.rpm
          : rpm // ignore: cast_nullable_to_non_nullable
              as int?,
      hdm: freezed == hdm
          ? _value.hdm
          : hdm // ignore: cast_nullable_to_non_nullable
              as int?,
      hdt: freezed == hdt
          ? _value.hdt
          : hdt // ignore: cast_nullable_to_non_nullable
              as int?,
      trm: freezed == trm
          ? _value.trm
          : trm // ignore: cast_nullable_to_non_nullable
              as int?,
      trt: freezed == trt
          ? _value.trt
          : trt // ignore: cast_nullable_to_non_nullable
              as int?,
      gsp: freezed == gsp
          ? _value.gsp
          : gsp // ignore: cast_nullable_to_non_nullable
              as int?,
      ias: freezed == ias
          ? _value.ias
          : ias // ignore: cast_nullable_to_non_nullable
              as int?,
      tas: freezed == tas
          ? _value.tas
          : tas // ignore: cast_nullable_to_non_nullable
              as int?,
      siu: freezed == siu
          ? _value.siu
          : siu // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BrokenTimeCopyWith<$Res> get time {
    return $BrokenTimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
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
abstract class _$$IGCFixImplCopyWith<$Res> implements $IGCFixCopyWith<$Res> {
  factory _$$IGCFixImplCopyWith(
          _$IGCFixImpl value, $Res Function(_$IGCFixImpl) then) =
      __$$IGCFixImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BrokenTime time,
      GeoPoint location,
      bool gpsValid,
      int gpsAltitude,
      dynamic pressureAltitude,
      int? enl,
      int? rpm,
      int? hdm,
      int? hdt,
      int? trm,
      int? trt,
      int? gsp,
      int? ias,
      int? tas,
      int? siu});

  @override
  $BrokenTimeCopyWith<$Res> get time;
  @override
  $GeoPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$IGCFixImplCopyWithImpl<$Res>
    extends _$IGCFixCopyWithImpl<$Res, _$IGCFixImpl>
    implements _$$IGCFixImplCopyWith<$Res> {
  __$$IGCFixImplCopyWithImpl(
      _$IGCFixImpl _value, $Res Function(_$IGCFixImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? location = null,
    Object? gpsValid = null,
    Object? gpsAltitude = null,
    Object? pressureAltitude = freezed,
    Object? enl = freezed,
    Object? rpm = freezed,
    Object? hdm = freezed,
    Object? hdt = freezed,
    Object? trm = freezed,
    Object? trt = freezed,
    Object? gsp = freezed,
    Object? ias = freezed,
    Object? tas = freezed,
    Object? siu = freezed,
  }) {
    return _then(_$IGCFixImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as BrokenTime,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
      gpsValid: null == gpsValid
          ? _value.gpsValid
          : gpsValid // ignore: cast_nullable_to_non_nullable
              as bool,
      gpsAltitude: null == gpsAltitude
          ? _value.gpsAltitude
          : gpsAltitude // ignore: cast_nullable_to_non_nullable
              as int,
      pressureAltitude: freezed == pressureAltitude
          ? _value.pressureAltitude!
          : pressureAltitude,
      enl: freezed == enl
          ? _value.enl
          : enl // ignore: cast_nullable_to_non_nullable
              as int?,
      rpm: freezed == rpm
          ? _value.rpm
          : rpm // ignore: cast_nullable_to_non_nullable
              as int?,
      hdm: freezed == hdm
          ? _value.hdm
          : hdm // ignore: cast_nullable_to_non_nullable
              as int?,
      hdt: freezed == hdt
          ? _value.hdt
          : hdt // ignore: cast_nullable_to_non_nullable
              as int?,
      trm: freezed == trm
          ? _value.trm
          : trm // ignore: cast_nullable_to_non_nullable
              as int?,
      trt: freezed == trt
          ? _value.trt
          : trt // ignore: cast_nullable_to_non_nullable
              as int?,
      gsp: freezed == gsp
          ? _value.gsp
          : gsp // ignore: cast_nullable_to_non_nullable
              as int?,
      ias: freezed == ias
          ? _value.ias
          : ias // ignore: cast_nullable_to_non_nullable
              as int?,
      tas: freezed == tas
          ? _value.tas
          : tas // ignore: cast_nullable_to_non_nullable
              as int?,
      siu: freezed == siu
          ? _value.siu
          : siu // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$IGCFixImpl extends _IGCFix {
  _$IGCFixImpl(
      {required this.time,
      required this.location,
      required this.gpsValid,
      required this.gpsAltitude,
      this.pressureAltitude,
      this.enl,
      this.rpm,
      this.hdm,
      this.hdt,
      this.trm,
      this.trt,
      this.gsp,
      this.ias,
      this.tas,
      this.siu})
      : super._();

  @override
  BrokenTime time;
  @override
  GeoPoint location;
  @override
  bool gpsValid;
  @override
  int gpsAltitude;
  @override
  dynamic pressureAltitude;
/* extensions follow */
  /// Engine noise level [0 to 999].  null if undefined.
  @override
  int? enl;

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  @override
  int? rpm;

  /// Magnetic heading [degrees].  null if undefined.
  @override
  int? hdm;

  /// True heading [degrees].  null if undefined.
  @override
  int? hdt;

  /// Magnetic track [degrees].  null if undefined.
  @override
  int? trm;

  /// True track [degrees].  null if undefined.
  @override
  int? trt;

  /// Ground speed [km/h].  null if undefined.
  @override
  int? gsp;

  /// Indicated airspeed [km/h].  null if undefined.
  @override
  int? ias;

  /// True airspeed [km/h].  null if undefined.
  @override
  int? tas;

  /// Satellites in use.  null if undefined.
  @override
  int? siu;

  @override
  String toString() {
    return 'IGCFix(time: $time, location: $location, gpsValid: $gpsValid, gpsAltitude: $gpsAltitude, pressureAltitude: $pressureAltitude, enl: $enl, rpm: $rpm, hdm: $hdm, hdt: $hdt, trm: $trm, trt: $trt, gsp: $gsp, ias: $ias, tas: $tas, siu: $siu)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IGCFixImplCopyWith<_$IGCFixImpl> get copyWith =>
      __$$IGCFixImplCopyWithImpl<_$IGCFixImpl>(this, _$identity);
}

abstract class _IGCFix extends IGCFix {
  factory _IGCFix(
      {required BrokenTime time,
      required GeoPoint location,
      required bool gpsValid,
      required int gpsAltitude,
      dynamic pressureAltitude,
      int? enl,
      int? rpm,
      int? hdm,
      int? hdt,
      int? trm,
      int? trt,
      int? gsp,
      int? ias,
      int? tas,
      int? siu}) = _$IGCFixImpl;
  _IGCFix._() : super._();

  @override
  BrokenTime get time;
  set time(BrokenTime value);
  @override
  GeoPoint get location;
  set location(GeoPoint value);
  @override
  bool get gpsValid;
  set gpsValid(bool value);
  @override
  int get gpsAltitude;
  set gpsAltitude(int value);
  @override
  dynamic get pressureAltitude;
  set pressureAltitude(dynamic value);
  @override /* extensions follow */
  /// Engine noise level [0 to 999].  null if undefined.
  int? get enl; /* extensions follow */
  /// Engine noise level [0 to 999].  null if undefined.
  set enl(int? value);
  @override

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  int? get rpm;

  /// Forward thrust, e.g. engine rpm [0 to 999].  Negative if
  /// undefined.
  set rpm(int? value);
  @override

  /// Magnetic heading [degrees].  null if undefined.
  int? get hdm;

  /// Magnetic heading [degrees].  null if undefined.
  set hdm(int? value);
  @override

  /// True heading [degrees].  null if undefined.
  int? get hdt;

  /// True heading [degrees].  null if undefined.
  set hdt(int? value);
  @override

  /// Magnetic track [degrees].  null if undefined.
  int? get trm;

  /// Magnetic track [degrees].  null if undefined.
  set trm(int? value);
  @override

  /// True track [degrees].  null if undefined.
  int? get trt;

  /// True track [degrees].  null if undefined.
  set trt(int? value);
  @override

  /// Ground speed [km/h].  null if undefined.
  int? get gsp;

  /// Ground speed [km/h].  null if undefined.
  set gsp(int? value);
  @override

  /// Indicated airspeed [km/h].  null if undefined.
  int? get ias;

  /// Indicated airspeed [km/h].  null if undefined.
  set ias(int? value);
  @override

  /// True airspeed [km/h].  null if undefined.
  int? get tas;

  /// True airspeed [km/h].  null if undefined.
  set tas(int? value);
  @override

  /// Satellites in use.  null if undefined.
  int? get siu;

  /// Satellites in use.  null if undefined.
  set siu(int? value);
  @override
  @JsonKey(ignore: true)
  _$$IGCFixImplCopyWith<_$IGCFixImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
