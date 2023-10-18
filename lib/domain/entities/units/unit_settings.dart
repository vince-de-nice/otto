import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otto/domain/entities/units/unit.dart';
import 'package:otto/domain/entities/units/unit_group.dart';

part 'unit_settings.freezed.dart';

@unfreezed
class UnitSetting with _$UnitSetting
{

  const UnitSetting._();
const factory UnitSetting({
  /// Unit for distances
  required Unit distanceUnit,
  /// Unit for altitudes, heights
  required Unit altitudeUnit,
  /// Unit for temperature
  required Unit temperatureUnit,
  /// Unit for aircraft speeds
  required Unit speedUnit,
  /// Unit for vertical speeds, varios
  required Unit verticalSpeedUnit,
  /// Unit for wind speeds
  required Unit windSpeedUnit,
  /// Unit for task speeds
  required Unit taskSpeedUnit,
  /// Unit for pressures
  required Unit pressureUnit,
  /// Unit for wing loading
  required Unit wingLoadingUnit,
  /// Unit for mass
  required Unit massUnit,
  /// Unit for rotation speed
  required Unit rotationUnit,

  })=_UnitSetting;

  void setDefaults(){
  distanceUnit = Unit.kilometer;
  altitudeUnit = Unit.meter;
  temperatureUnit = Unit.degreesCelcius;
  speedUnit = Unit.kilometerPerHour;
  verticalSpeedUnit = Unit.meterPerSecond;
  windSpeedUnit = Unit.kilometerPerHour;
  taskSpeedUnit = Unit.kilometerPerHour;
  pressureUnit = Unit.hectopascal;
  wingLoadingUnit = Unit.kgPerM2;
  massUnit = Unit.kg;
  rotationUnit = Unit.rpm;
}

  /// Return the configured unit for a given group.
  Unit getByGroup(UnitGroup group) {
  switch (group) {
  case UnitGroup.none:
    break;

  case UnitGroup.distance:
    return distanceUnit;

  case UnitGroup.altitude:
    return altitudeUnit;

  case UnitGroup.temperature:
    return temperatureUnit;

  case UnitGroup.horizontalSpeed:
    return speedUnit;

  case UnitGroup.verticalSpeed:
    return verticalSpeedUnit;

  case UnitGroup.windSpeed:
    return windSpeedUnit;

  case UnitGroup.taskSpeed:
    return taskSpeedUnit;

  case UnitGroup.pressure:
    return pressureUnit;

  case UnitGroup.wingLoading:
    return wingLoadingUnit;

  case UnitGroup.mass:
    return massUnit;

  case UnitGroup.rotation:
    return rotationUnit;
  }

  return Unit.undefined;
}

  // friend constexpr auto operator<=>(const UnitSetting &,
  //                                   const UnitSetting &) noexcept = default;
}