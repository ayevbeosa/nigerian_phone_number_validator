library nigerian_phone_number_validator;

// import 'package:flutter/material.dart';

const String _nigeriaDialCode = '234';

RegExp _nigeriaPhoneNumberRegExp = RegExp(r'^(\+234|0)[789]\d{9}$');

const String _defaultErrorMessage = 'Phone number is invalid';

/// A Calculator.
class NigerianPhoneNumberValidator {
  // final e = TextFormField(
  //   validator: validate,
  // );

  /// Returns [value] plus 1.
  static String? validate(String? phone, [String? errorMessage]) {
    if (phone == null) return errorMessage ?? _defaultErrorMessage;

    if (_nigeriaPhoneNumberRegExp.hasMatch(phone)) {
      return null;
    } else {
      return errorMessage ?? _defaultErrorMessage;
    }
  }

  static String sanitise(String phoneNumber) {
    if (validate(phoneNumber) != null) {
      throw const FormatException('Phone number is invalid');
    }
    if (phoneNumber.startsWith('0') || phoneNumber.startsWith('+')) {
      phoneNumber = phoneNumber.substring(1);
    }
    if (phoneNumber.startsWith(_nigeriaDialCode)) {
      return phoneNumber;
    }
    return '$_nigeriaDialCode$phoneNumber';
  }
}
