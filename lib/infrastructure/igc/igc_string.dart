// SPDX-License-Identifier: GPL-2.0-or-later
// Copyright The XCSoar Project


/// Is this a "reserved" character?
///
/// Note that this doesn't check for CR/LF because these aren't allowed
/// within a line anyway.  No idea why these are mentioned in the
/// specification.
///
/// @see IGC specification, section A6
  bool
isReservedIGCChar(String ch) 
{
  return ch[0] == '\$' || ch[0] == '*' || ch[0] == '!' || ch[0] == '\\' ||
    ch[0] == '^' || ch[0] == '~';
}

/// Is this a "valid" character?
///
/// @see IGC specification, section A6
  bool
isValidIGCChar(String ch) 
{
  return ch.codeUnitAt(0) >= 0x20 && ch.codeUnitAt(0) <= 0x7e && !isReservedIGCChar(ch);
}

// #ifdef _UNICODE
// static constexpr bool
// IsValidIGCChar(TCHAR ch) noexcept
// {
//   return ch >= 0x20 && ch <= 0x7e && !IsReservedIGCChar(char(ch));
// }
// #endif

/// Copy a null-terminated string to a buffer to be written to an IGC
/// file.  If the string is too long for the buffer, it is truncated.
/// The destination buffer will not be null-terminated.
// String
// copyIGCString(char *dest, char *dest_limit, const char *src){
//   assert(dest != nullptr);
//   assert(dest_limit > dest);
//   assert(src != nullptr);

//   while (*src != '\0') {
//     char ch = *src++;
//     if (isValidIGCChar(ch)) {
//       *dest++ = ch;
//       if (dest == dest_limit)
//         break;
//     }
//   }

//   return dest;
// }


// #ifdef _UNICODE
// char *
// CopyIGCString(char *dest, char *dest_limit, const TCHAR *src) {
//   assert(dest != nullptr);
//   assert(dest_limit > dest);
//   assert(src != nullptr);

//   while (*src != '\0') {
//     TCHAR ch = *src++;
//     if (IsValidIGCChar(ch)) {
//       *dest++ = ch;
//       if (dest == dest_limit)
//         break;
//     }
//   }

//   return dest;
// }
// #endif