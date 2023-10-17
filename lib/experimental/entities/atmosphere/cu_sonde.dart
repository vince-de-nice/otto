// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project

import 'package:otto/entities/nmea/derived.dart';

import 'temperature.dart';

/// Dry adiabatic lapse rate (degrees C per meter)
///
/// DALR = dT/dz = g/c_p =
/// @see http://en.wikipedia.org/wiki/Lapse_rate#Dry_adiabatic_lapse_rate
/// @see http://pds-atmospheres.nmsu.edu/education_and_outreach/encyclopedia/adiabatic_lapse_rate.htm
const double DALR = -0.00974;

/// ThermalIndex threshold in degrees C */
const double TITHRESHOLD = -1.6;

class Level {
  const Level(
      {required this.airTemperature,
      required this.cloudBase,
      required this.dewpoint,
      required this.dryTemperature,
      required this.hasData,
      required this.hasDewpoint,
      required this.thermalHeight,
      required this.thermalIndex});

  factory Level.none() {
    return const Level(
        airTemperature: Temperature(0),
        cloudBase: 0,
        dewpoint: Temperature(0),
        dryTemperature: Temperature(0),
        hasData: false,
        hasDewpoint: false,
        thermalHeight: 0,
        thermalIndex: Temperature(0));
  }

  /// Environmental temperature in K */
  final Temperature airTemperature;

  /// DewPoint in K */
  final Temperature dewpoint;

  /// Dry temperature in K */
  final Temperature dryTemperature;

  /// ThermalIndex in K */
  final Temperature thermalIndex;

  /// Has any data */
  final bool hasData;

  /// Has dewpoint data */
  final bool hasDewpoint;

  /// Estimated ThermalHeight with data of this level */
  final double thermalHeight;

  /// Estimated CloudBase with data of this level */
  final double cloudBase;

  //     void UpdateTemps(bool humidity_valid, double humidity,  Temperature temperature) ;
  // void UpdateThermalIndex(double h_agl,        Temperature max_ground_temperature) ;

  bool empty() {
    return !hasData;
  }

  bool dewpointEmpty() {
    return !hasDewpoint;
  }

  // void reset() {
  //   hasData = false;
  //   hasDewpoint = false;
  // }
}
// struct NMEAInfo;
// struct DerivedInfo;

/// Namespaces that provides simple estimates of thermal heights from lapse rates
/// derived from temperature trace obtained during flight.
class CuSonde {
  CuSonde(this.cloudBase, this.groundHeight, this.lastLevel,
      this.maxGroundTemperature, this.thermalHeight);

  /// Meters between levels */
  static const int HEIGHT_STEP = 100;

  /// Expected temperature maximum on the ground */
  Temperature maxGroundTemperature;

  /// Height of ground above MSL */
  double groundHeight;
  int lastLevel;
  final List<Level> cslevels =
      List<Level>.filled(100, Level.none(), growable: false);

  /// Estimated ThermailHeight */
  double thermalHeight;

  /// Estimated CloudBase */
  double cloudBase;

//   void reset() {
//     lastLevel = 0;
//     thermalHeight = 0;
//     cloudBase = 0;
//     groundHeight = 0;
//     maxGroundTemperature = Temperature.fromCelsius(25);

//     for (final i in cslevels) {
//       i.reset();
//     }
//   }

//   // TODO accuracy: recalculate thermal index etc if maxGroundTemp changes

// /// Update the measurements if new level reached
// /// [basic] NMEA_INFO for temperature and humidity
//   void updateMeasurements(NMEAInfo basic, DerivedInfo calculated){
//   // if (not flying) nothing to update...
//   if (!calculated.flight.flying) {
//     return;
//   }

//   // if (no temperature or humidity available) nothing to update...
//   if (!basic.temperature_available) {
//     return;
//   }

//   // find appropriate level
//   final anyAltitude = basic.getAnyAltitude();
//   if (!anyAltitude) {
//     return;
//   }

//   final double altitude = anyAltitude;

//   int level = (max(altitude,0.0) as int/ HEIGHT_STEP);

//   // if (level out of range) cancel update
//   if (level >= cslevels.length) {
//     return;
//   }

//   // if (level skipped) cancel update
//   if (abs(level - lastLevel) > 1) {
//     lastLevel = level;
//     return;
//   }

//   // if (no level transition yet) wait for transition
//   if (abs(level - lastLevel) == 0) {
//     return;
//   }

//   // calculate ground height
//   groundHeight = calculated.altitudeAgl;

//   // if (going up)
//   if (level > lastLevel) {
//     // we round down (level) because of potential lag of temp sensor
//     cslevels[level].updateTemps(basic.humidity_available,
//                                 basic.humidity,
//                                 basic.temperature);

//     var hAgl = level * HEIGHT_STEP - groundHeight;
//     cslevels[level].updateThermalIndex(hAgl, maxGroundTemperature);

//     if (level > 0) {
//       findThermalHeight((level - 1));
//       findCloudBase((level - 1));
//     }

//   // if (going down)
//   } else {
//     // we round up (level+1) because of potential lag of temp sensor
//     cslevels[level + 1].updateTemps(basic.humidity_available,
//                                     basic.humidity,
//                                     basic.temperature);

//     var hAgl = (level + 1) * HEIGHT_STEP - groundHeight;
//     cslevels[level + 1].updateThermalIndex(hAgl, maxGroundTemperature);

//     if (level < cslevels.length - 1) {
//       findThermalHeight(level);
//       findCloudBase(level);
//     }
//   }

//   lastLevel = level;
// }

// /// Finds the estimated CloudBase based on the given level and the one
// /// above
// /// @param level Level used for calculation
//   void findCloudBase(int level){
//   if (cslevels[level + 1].dewpoint_empty()) {
//     return;
//   }
//   if (cslevels[level].dewpoint_empty()) {
//     return;
//   }

//   var dti = (cslevels[level + 1].dryTemperature - cslevels[level + 1].dewpoint)
//                - (cslevels[level].dryTemperature - cslevels[level].dewpoint);

//   // Reset estimated CloudBase
//   cslevels[level].cloudBase = -1;

//   if (dti.Absolute() < Temperature.fromKelvin(0.001))
//     return;

//   // ti = dlevel * dti + ti0;
//   // (-3 - ti0)/dti = dlevel;

//   var dlevel = -(cslevels[level].dryTemperature - cslevels[level].dewpoint).ToKelvin() / dti.ToKelvin();
//   var dcloudbase = (level + dlevel) * HEIGHT_STEP;

//   if (dlevel > 1
//       && level + 2u < cslevels.size()
//       && !cslevels[level + 2].empty()){
//     // estimated point should be in next level.
//     return;
//       }

//   if (dlevel > 0) {
//     // set the level cloudbase to the calculated value
//     cslevels[level].cloudBase = dcloudbase;

//     // set the overall cloudbase to the calculated value
//     cloudBase = dcloudbase;
//   }
// }

//   /**
//  * Finds the estimated ThermalHeight based on the given level and the one
//  * above
//  * @param level Level used for calculation
//  */
//   void findThermalHeight(int level){
//   if (cslevels[level + 1].empty()) {
//     return;
//   }
//   if (cslevels[level].empty()) {
//     return;
//   }

//   // Delta of ThermalIndex
//   var dti = cslevels[level + 1].thermalIndex - cslevels[level].thermalIndex;

//   // Reset estimated ThermalHeight
//   cslevels[level].thermalHeight = -1;

//   if (dti.Absolute() < Temperature.fromKelvin(0.001))
//     return;

//   // ti = dlevel * dti + ti0;
//   // (-1.6 - ti0)/dti = dlevel;

//   var dlevel = (TITHRESHOLD - cslevels[level].thermalIndex.toKelvin()) / dti.toKelvin();
//   var dthermalheight = (level + dlevel) * HEIGHT_STEP;

//   if (dlevel > 1
//       && level + 2u < cslevels.length
//       && !cslevels[level + 2].empty()) {
//               // estimated point should be in next level.
//     return;
//   }

//   if (dlevel > 0) {
//     // set the level thermal height to the calculated value
//     cslevels[level].thermalHeight = dthermalheight;

//     // set the overall thermal height to the calculated value
//     thermalHeight = dthermalheight;
//   }
// }

//   /**
//  * Sets the predicted maximum ground temperature to val
//  * @param val New predicted maximum ground temperature in K
//  */
//   void setForecastTemperature(Temperature val) {
//     if (maxGroundTemperature == val) return;

//     maxGroundTemperature = val;

//     int zlevel = 0;

//     // set these to invalid, so old values must be overwritten
//     cloudBase = -1;
//     thermalHeight = -1;

//     // iterate through all levels
//     var hAgl = -CuSonde.groundHeight;
//     for (var level = 0; level < cslevels.length; level++, hAgl += HEIGHT_STEP) {
//       // update the ThermalIndex for each level with
//       // the new max_ground_temperature
//       cslevels[level].updateThermalIndex(hAgl, maxGroundTemperature);

//       // determine to which level measurements are available
//       if (!cslevels[level].empty()) {
//         zlevel = level;
//       }

//       if (cslevels[level].empty() && zlevel) break;
//     }

//     // iterate through all levels with measurements
//     for (var level = 0; level <= zlevel; level++) {
//       // calculate ThermalHeight
//       findThermalHeight(level);
//       // calculate CloudBase
//       findCloudBase(level);
//     }
//   }
// }
}

// extension LevelExtension on Level{

// /// Calculates the dew point and saves the measurement
// /// @param rh Humidity in percent
// /// @param t Temperature in K
// void updateTemps(bool humidityValid, double humidity,
//                             Temperature temperature)
// {
//   if (humidityValid)
//   {
//     var _dewpoint = calculateDewPoint(temperature, humidity);

//     if (dewpoint_empty())
//       dewpoint = _dewpoint;
//     else
//       dewpoint = (_dewpoint + dewpoint) / 2;

//     hasDewpoint = true;
//   }

//   // update statistics
//   if (empty())
//     airTemperature = temperature;
//   else
//     airTemperature = (temperature + airTemperature) / 2;

//   hasData = true;
// }

// /// Calculates the ThermalIndex for the given height level
// ///
// /// ThermalIndex is the difference in dry temp and environmental temp
// /// at the specified altitude.
// /// @param level level = altitude / HEIGHT_STEP
// /// @param newdata Function logs data to debug file if true
// void updateThermalIndex(double hAgl,Temperature maxGroundTemperature)
// {
//   // Calculate the dry temperature at altitude = hlevel
//   dryTemperature = maxGroundTemperature + Temperature.fromKelvin(DALR * hAgl);

//   // Calculate ThermalIndex
//   thermalIndex = airTemperature - dryTemperature;
// }


