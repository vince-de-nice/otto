// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project



// #include "Geo/GeoPoint.hpp"
// #include "Geo/SpeedVector.hpp"
// #include "Task/Stats/TaskStats.hpp"
// #include "Task/Stats/CommonStats.hpp"
// #include "Contest/ContestStatistics.hpp"
// #include "FlyingState.hpp"
// #include "NMEA/VarioInfo.hpp"
// #include "NMEA/ClimbInfo.hpp"
// #include "NMEA/CirclingInfo.hpp"
// #include "Engine/ThermalBand/ThermalEncounterBand.hpp"
// #include "Engine/ThermalBand/ThermalEncounterCollection.hpp"
// #include "NMEA/ThermalLocator.hpp"
// #include "NMEA/Validity.hpp"
// #include "NMEA/ClimbHistory.hpp"
// #include "TeamCode/TeamCode.hpp"
// #include "Engine/Navigation/TraceHistory.hpp"
// #include "time/BrokenDateTime.hpp"
// #include "Engine/GlideSolvers/GlidePolar.hpp"
// #include "Atmosphere/Pressure.hpp"
// #include "Engine/Route/Route.hpp"
// #include "Computer/WaveResult.hpp"



import 'circling_info.dart';
import 'climb_info.dart';



  enum WindSource  {
    /// No wind vector available.  This should be kept in sync with
    /// #wind_available.
    NONE,

    /// The user has entered a wind vector manually.
    MANUAL,

    /// Calculated by #CirclingWind.
    CIRCLING,

    /// Calculated by #WindEKF.
    EKF,

    /// The wind vector was received from an external device.
    EXTERNAL,
  } 

/// Derived terrain altitude information, including glide range */
class TerrainInfo
{
  /// True if terrain is valid, False otherwise */
  bool terrainValid =false;

  /// Does the attribute #TerrainBase have a valid value? */
  bool terrainBaseValid = false;

  /// Does the attribute #AltitudeAGL have a valid value? */
  bool altitudeAglValid=false;

  /// Terrain altitude */
  double terrainAltitude=0;

  /// Lowest height within glide range */
  double terrainBase=0;

  /// Altitude over terrain */
  double altitudeAgl=0;

  /// Location of terrain warning.
  ///
  /// Check GeoPoint::IsValid().
  GeoPoint terrain_warning_location;

  void clear(){
  teammateAvailable = false;

  ownTeammateCode.clear();

  flarmTeammateCode.clear();
}

  /// Returns the terrain base, and falls back for terrain altitude if
  /// the base is not known.
  double GetTerrainBaseFallback()  {
    return terrainBaseValid
      ? terrainBase
      : terrainAltitude;
  }
}


/// Derived team code information */
class TeamInfo
{
  /// Are #teammate_vector and #TeammateLocation available? */
  bool teammateAvailable;

  /// is #flarm_teammate_code current or did we lose him? */
  bool flarmTeammateCodeCurrent;

  /// Team code */
  TeamCode ownTeammateCode;

  /// Vector to the chosen team mate */
  GeoVector teammateVector;

  /// Position of the chosen team mate */
  GeoPoint teammateLocation;

  /// The team code of the FLARM teammate.  Check TeamCode::IsDefined()
  /// before using this attribute.
  TeamCode flarmTeammateCode;

  void clear(){
  teammateAvailable = false;

  ownTeammateCode.clear();

  flarmTeammateCode.clear();
}
}



class AirspaceWarningsInfo {
  /// The time stamp of the most recent airspace warning.  Check if
  /// this value gets increased to see if there's a new warning.
  Validity latest;

  void clear(){
  latest.Clear();
}
}



/// A struct that holds all the calculated values derived from the data in the
/// NMEA_INFO struct
class DerivedInfo 
 {
    VarioInfo varioInfo;
   ClimbInfo climbInfo;
   CirclingInfo circlingInfo;
   TerrainInfo terrainInfo;
   TeamInfo teamInfo;
  /// GPS date and time (local).
  ///
  /// Check IsPlausible(), IsDatePlausible() or IsTimePlausible()
  /// before using this attribute.
  BrokenDateTime dateTimeLocal;

  /// Speed to fly block/dolphin (m/s) */
  double vStf;

  /// Auto QNH calculation result. */
  AtmosphericPressure pressure;
  Validity pressureAvailable;

  ClimbHistory climbHistory;

  WaveResult wave;

  /// Does #estimated_wind have a meaningful value? */
  Validity estimatedWindAvailable;

  /// Wind speed, direction */
  SpeedVector estimatedWind;

  /// Is the wind available? */
  Validity windAvailable;

  /// The effective wind vector; depending on the settings, this is
  /// either ExternalWind, calculated wind or manual wind.
  SpeedVector wind;

  
   /// Where did we obtain the effective wind vector?
  WindSource windSource;

  Validity headWindAvailable;
  double headWind;

  /// Distance to zoom to for autozoom */
  double autoZoomDistance;

  Validity sunDataAvailable;
  /// Sun's azimuth at the current location and time */
  Angle sunAzimuth;

  /// Copy of task statistics data for active task */
  TaskStats taskStats;

  /// Copy of task statistics data for ordered task */
  TaskStats orderedTaskStats;

  /// Copy of common task statistics data */
  CommonStats commonStats;
  /// Copy of contest statistics data */
  ContestStatistics contestStats;

  FlyingState flight;

  ThermalEncounterBand thermalEncounterBand;
  ThermalEncounterCollection thermalEncounterCollection;

  ThermalLocatorInfo thermalLocator;

  /// Store of short term history of variables */
  TraceHistory traceHistory;

  Validity autoMacCreadyAvailable;
  double autoMacCready;

  /// Glide polar used for safety calculations */
  GlidePolar glidePolarSafety;

  AirspaceWarningsInfo airspaceWarnings;

  /// Route plan for current leg avoiding airspace */
  StaticRoute plannedRoute;

  /// Thermal value of next leg that is equivalent (gives the same average
  /// speed) to the current MacCready setting. A negative value should be
  /// treated as invalid.
  double nextLegEqThermal;

  /// @todo Reset to cleared state
  void reset(){
  dateTimeLocal = BrokenDateTime.Invalid;

  varioInfo.clear();
  climbInfo.clear();
  circlingInfo.clear();
  teamInfo.clear();
  terrainInfo.clear();
  teamInfo.clear();

  pressureAvailable.Clear();

  climbHistory.Clear();

  wave.Clear();

  estimatedWindAvailable.Clear();
  windAvailable.Clear();
  windSource = WindSource.NONE;
  headWindAvailable.Clear();
  sunDataAvailable.Clear();
  taskStats.reset();
  orderedTaskStats.reset();
  commonStats.Reset();
  contestStats.Reset();

  flight.Reset();

  thermalEncounterBand.Reset();
  thermalEncounterCollection.Reset();

  thermalLocator.Clear();

  traceHistory.clear();

  autoMacCreadyAvailable.Clear();

  glidePolarSafety = GlidePolar.Invalid();

  airspaceWarnings.clear();

  plannedRoute.clear();
}

  void Expire(TimeStamp time){
  // NOTE: wind_available is deliberately not expired. Expiry happens automatically
  // due to the expiration of the real wind source. If wind_available would be
  // expired here (with an shorter expiry time then the source) this would lead
  // to alternating valid/invalid transitions (valid after the source is copied,
  // Invalidated shortly after the copy here).

  /* the estimated wind remains valid for an hour */
  estimatedWindAvailable.Expire(Time, std::chrono::hours(1));

  headWindAvailable.Expire(Time, std::chrono::seconds(3));

  autoMacCreadyAvailable.Expire(Time, std::chrono::hours(1));
  sunDataAvailable.Expire(Time, std::chrono::hours(1));
}

  /// Return the current wind vector, or the null vector if no wind is
  /// available.

  SpeedVector GetWindOrZero()  {
    return windAvailable
      ? wind
      : SpeedVector::Zero();
  }

  void ProvideAutoMacCready(TimeStamp clock, double mc) {
    if (autoMacCreadyAvailable &&
        fabs(autoMacCready - mc) < 0.05)
      /* change is too small, ignore the new value to limit the rate */
      return;

    autoMacCready = mc;
    autoMacCreadyAvailable.Update(clock);
  }

  // utility function
  double CalculateWorkingFraction( double h,  double safetyHeight) {
  const double hFloor = GetTerrainBaseFallback() + safetyHeight;
  const double hBand = (commonStats.heightMaxWorking - hFloor);
  if (hBand>0) {
    const double hActual = h - hFloor;
    return hActual / hBand;
  } else {
    return 1;
  }
}
}

