class VegaSwitchState {
  static const int invalid = -1;

  static const inputMaskFlapPositive = 1 << InputBits.inputFlapPositive;
  static const inputMaskFlapZero = 1 << InputBits.inputFlapZero;
  static const inputMaskFlapNegative = 1 << InputBits.inputFlapNegative;
  static const inputMaskSc = 1 << InputBits.inputSpeedCommand;
  static const inputMaskGearExtended = 1 << InputBits.inputGearExtended;
  static const inputMaskAirbrakeNotLocked =
      1 << InputBits.inputAirbrakeNotLocked;
  static const inputMaskAck = 1 << InputBits.inputAcknowledge;
  static const inputMaskRep = 1 << InputBits.inputRepeat;
  static const inputMaskAirbrakeLocked = 1 << InputBits.inputAirbrakeLocked;
  static const inputMaskUserSwitchUp = 1 << InputBits.inputUserSwitchUp;
  static const inputMaskUserSwitchMiddle = 1 << InputBits.inputUserSwitchMiddle;
  static const inputMaskUserSwitchDown = 1 << InputBits.inputUserSwitchDown;
  static const outputMaskCircling = 1 << OutputBits.outputCircling;
  static const outputMaskFlapLanding = 1 << OutputBits.outputFlapLanding;

  int inputs = 0, outputs = 0;

  bool isDefined() {
    return inputs != 0 || outputs != 0;
  }

  void reset() {
    inputs = outputs = 0;
  }

  bool getFlapPositive() {
    return (inputs & inputMaskFlapPositive) != 0;
  }

  bool getFlapZero() {
    return (inputs & inputMaskFlapZero) != 0;
  }

  bool getFlapNegative() {
    return (inputs & inputMaskFlapNegative) != 0;
  }

  bool getSpeedCommand() {
    return (inputs & inputMaskSc) != 0;
  }

  bool getGearExtended() {
    return (inputs & inputMaskGearExtended) != 0;
  }

  bool getAirbrakeNotLocked() {
    return (inputs & inputMaskAirbrakeNotLocked) != 0;
  }

  bool getAcknowledge() {
    return (inputs & inputMaskAck) != 0;
  }

  bool getRepeat() {
    return (inputs & inputMaskRep) != 0;
  }

  bool getAirbrakeLocked() {
    return (inputs & inputMaskAirbrakeLocked) != 0;
  }

  bool getUserSwitchUp() {
    return (inputs & inputMaskUserSwitchUp) != 0;
  }

  bool getUserSwitchMiddle() {
    return (inputs & inputMaskUserSwitchMiddle) != 0;
  }

  bool getUserSwitchDown() {
    return (inputs & inputMaskUserSwitchDown) != 0;
  }

  bool getCircling() {
    return (outputs & outputMaskCircling) != 0;
  }

  bool getFlapLanding() {
    return (outputs & outputMaskFlapLanding) != 0;
  }
}

class InputBits {
  static const int inputFlapPositive = 0;
  static const int inputFlapZero = 1;
  static const int inputFlapNegative = 2;
  static const int inputSpeedCommand = 3;
  static const int inputGearExtended = 5;
  static const int inputAirbrakeNotLocked = 6;
  static const int inputAcknowledge = 8;
  static const int inputRepeat = 9;
  static const int inputStall = 20;
  static const int inputAirbrakeLocked = 21;
  static const int inputUserSwitchUp = 23;
  static const int inputUserSwitchMiddle = 24;
  static const int inputUserSwitchDown = 25;
}

class OutputBits {
  static const int outputCircling = 0;
  static const int outputFlapLanding = 7;
}
