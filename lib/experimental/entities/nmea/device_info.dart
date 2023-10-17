/// Some generic information about the connected device.
///
/// This struct was initially modeled after the $LXWP1 sentence (LXNav
/// and LX Navigation).
///
/// There is no Validity attribute.  All strings that are non-empty can
/// be assumed to be valid.  Also note that there is no Expire()
/// method, because we assume the device may send the data once on
/// startup and never again.  Having this initial value is better than
/// nothing.
class DeviceInfo {
  const DeviceInfo({
    required this.product,
    required this.hardwareVersion,
    required this.softwareVersion,
    required this.serial,
  });

  /// The name of the product.
  final String product; //NarrowString<16>

  /// The serial number.  This is a string because we're not sure if a
  /// device sends non-numeric data here.
  final String serial;

  /// The hardware version number.
  final String hardwareVersion;

  /// The software (or firmware) version number.
  final String softwareVersion;
}
