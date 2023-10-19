import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otto/domain/entities/units/unit.dart';
import 'package:otto/domain/entities/units/unit_group.dart';

part 'unit_settings.freezed.dart';

@freezed
class UnitSetting with _$UnitSetting {
  const UnitSetting._();
  const factory UnitSetting({
    /// Unit for distances
    @Default(Unit.kilometer)  Unit distanceUnit,

    /// Unit for altitudes, heights
    @Default(Unit.meter)  Unit altitudeUnit,

    /// Unit for temperature
    @Default(Unit.degreesCelcius)  Unit temperatureUnit,

    /// Unit for aircraft speeds
    @Default(Unit.kilometerPerHour)  Unit speedUnit,

    /// Unit for vertical speeds, varios
    @Default(Unit.meterPerSecond)  Unit verticalSpeedUnit,

    /// Unit for wind speeds
    @Default(Unit.kilometerPerHour)  Unit windSpeedUnit,

    /// Unit for task speeds
    @Default(Unit.kilometerPerHour)  Unit taskSpeedUnit,

    /// Unit for pressures
    @Default(Unit.hectopascal)  Unit pressureUnit,

    /// Unit for wing loading
    @Default(Unit.kgPerM2)  Unit wingLoadingUnit,

    /// Unit for mass
    @Default(Unit.kg)  Unit massUnit,

    /// Unit for rotation speed
    @Default(Unit.rpm) Unit rotationUnit,
  }) = _UnitSetting;



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
