/// Calculates the checksum for the specified line (without the
/// asterisk and the newline character).
///
/// @param p a string
/// @param length the number of characters in the string
int getNMEAChecksum(String p, [int? length]) {
  int checksum = 0;
  int stringLength = length ?? 0;
  int i = stringLength;

  /* skip the dollar sign at the beginning (the exclamation mark is
     used by CAI302 */
  if (i > 0 && (p[0] == '\$' || p[0] == '!')) {
    ++i;
  }

  for (; i < stringLength; ++i) {
    checksum ^= p.codeUnitAt(i);
  }

  return checksum;
}

/// Verify the NMEA checksum at the end of the specified string,
/// separated with an asterisk ('*').
bool verifyNMEAChecksum(String p) {
  int index = p.indexOf('*');
  if (index != -1) {
    final int? readCheckSum = int.tryParse(p.substring(index + 1), radix: 16);
    if (readCheckSum != null) {
      int calcCheckSum = getNMEAChecksum(p, p.length - index);
      return calcCheckSum == readCheckSum;
    }
  }
  return false;
}

/// Caclulates the checksum of the specified string, and appends it at
/// the end, preceded by an asterisk ('*').
String appendNMEAChecksum(String p) {
  return "p${p.length}*${getNMEAChecksum(p).toRadixString(16).padLeft(2, '0')}";
}
