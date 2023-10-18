// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

// #pragma once

// #include "Settings.hpp"
// #include "System.hpp"

// #include <tchar.h>

// class AtmosphericPressure;

import 'package:otto/domain/entities/athmosphere/atmospheric_pressure.dart';
import 'package:otto/domain/entities/units/unit.dart';
import 'package:otto/domain/entities/units/unit_group.dart';
import 'package:otto/domain/entities/units/unit_settings.dart';

const DEG =  "°";

var current =const UnitSetting(
    distanceUnit : Unit.kilometer,
  altitudeUnit : Unit.meter,
  temperatureUnit : Unit.degreesCelcius,
  speedUnit : Unit.kilometerPerHour,
  verticalSpeedUnit : Unit.meterPerSecond,
  windSpeedUnit : Unit.kilometerPerHour,
  taskSpeedUnit : Unit.kilometerPerHour,
  pressureUnit : Unit.hectopascal,
  wingLoadingUnit : Unit.kgPerM2,
  massUnit : Unit.kg,
  rotationUnit : Unit.rpm,

);

/// Namespace to manage unit conversions.
/// internal system units are (metric SI).
abstract class Units {

// extern UnitSetting current;

void
setConfig( UnitSetting newConfig){
  current = newConfig;
}
/// Returns the user-specified unit for a wing loading
/// @return The user-specified unit for a wing loading

Unit
getUserWingLoadingUnit(){
  return current.wingLoadingUnit;
}
/// Returns the user-specified unit for mass
/// @return The user-specified unit for mass

Unit
getUserMassUnit(){
  return current.massUnit;
}

/// Returns the user-specified unit for a horizontal distance
/// @return The user-specified unit for a horizontal distance

Unit
getUserDistanceUnit(){
  return current.distanceUnit;
}

/// Returns the user-specified unit for an altitude
/// @return The user-specified unit for an altitude

Unit
getUserAltitudeUnit(){
  return current.altitudeUnit;
}

/// Returns the user-specified unit for a temperature
/// @return The user-specified unit for a temperature

Unit
getUserTemperatureUnit(){
  return current.temperatureUnit;
}

/// Returns the user-specified unit for a horizontal speed
/// @return The user-specified unit for a horizontal speed

Unit
getUserSpeedUnit(){
  return current.speedUnit;
}

/// Returns the user-specified unit for a task speed
/// @return The user-specified unit for a task speed

Unit
getUserTaskSpeedUnit(){
  return current.taskSpeedUnit;
}

/// Returns the user-specified unit for a vertical speed
/// @return The user-specified unit for a vertical speed

Unit
getUserVerticalSpeedUnit(){
  return current.verticalSpeedUnit;
}


/// Returns the user-specified unit for a wind speed
/// @return The user-specified unit for a wind speed

Unit
getUserWindSpeedUnit(){
  return current.windSpeedUnit;
}

/// Returns the user-specified unit for a pressure
/// @return The user-specified unit for a pressure

Unit
getUserPressureUnit(){
  return current.pressureUnit;
}


Unit
getUserUnitByGroup(UnitGroup group){
  return current.getByGroup(group);
}


String
getSpeedName(){
  return getUnitName(getUserSpeedUnit());
}


String
getVerticalSpeedName(){
  return getUnitName(getUserVerticalSpeedUnit());
}


String
getWindSpeedName(){
  return getUnitName(getUserWindSpeedUnit());
}


String
getDistanceName(){
  return getUnitName(getUserDistanceUnit());
}


String
getAltitudeName(){
  return getUnitName(getUserAltitudeUnit());
}



String
getTemperatureName(){
  return getUnitName(getUserTemperatureUnit());
}


String
getTaskSpeedName(){
  return getUnitName(getUserTaskSpeedUnit());
}


String
getPressureName(){
  return getUnitName(getUserPressureUnit());
}

static  double
toUserAltitude(double value)
{
  return toUserUnit(value, current.altitudeUnit);
}

static  double
toSysAltitude(double value)
{
  return toSysUnit(value, current.altitudeUnit);
}

static  double
toUserDistance(double value)
{
  return toUserUnit(value, current.distanceUnit);
}

static  double
toSysDistance(double value)
{
  return toSysUnit(value, current.distanceUnit);
}

static  double
toUserSpeed(double value)
{
  return toUserUnit(value, current.speedUnit);
}

static  double
toSysSpeed(double value)
{
  return toSysUnit(value, current.speedUnit);
}

static  double
toUserVSpeed(double value)
{
  return toUserUnit(value, current.verticalSpeedUnit);
}

static  double
toSysVSpeed(double value)
{
  return toSysUnit(value, current.verticalSpeedUnit);
}

static  double
toUserTaskSpeed(double value)
{
  return toUserUnit(value, current.taskSpeedUnit);
}

static  double
toSysTaskSpeed(double value)
{
  return toSysUnit(value, current.taskSpeedUnit);
}

static  double
toUserWindSpeed(double value)
{
  return toUserUnit(value, current.windSpeedUnit);
}

static  double
toSysWindSpeed(double value)
{
  return toSysUnit(value, current.windSpeedUnit);
}

static  double
toUserPressure(double Value)
{
  return toUserUnit(Value, current.pressureUnit);
}
  

double
toUserPressure(AtmosphericPressure value){
  return toUserPressure(value.getHectoPascal());
}

static  double
toSysPressure(double Value)
{
  return toSysUnit(Value, current.pressureUnit);
}

/// Convert a pressure value from the user unit to an
/// #AtmosphericPressure object.
AtmosphericPressure 
fromUserPressure(double value){
  return AtmosphericPressure.hectoPascal(toSysPressure(value));
}
  
static  double
toUserMass(double Value)
{
  return toUserUnit(Value, current.massUnit);
}
  
static  double
toSysMass(double Value)
{
  return toSysUnit(Value, current.massUnit);
}

static  double
toUserRotation(double Value) 
{
  return toUserUnit(Value, current.rotationUnit);
}

static  double
toSysRotation(double Value) 
{
  return toSysUnit(Value, current.rotationUnit);
}





} // namespace Units