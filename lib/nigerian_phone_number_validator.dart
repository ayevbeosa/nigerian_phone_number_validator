library nigerian_phone_number_validator;

const String _nigeriaDialCode = '234';

RegExp _nigeriaPhoneNumberRegExp = RegExp(r'^(\+234|0)[789]\d{9}$');

const String _defaultErrorMessage = 'Phone number is invalid';

/// Class has static methods that validates and sanitises
/// Nigerian phone numbers
class NigerianPhoneNumberValidator {
  /// Accepts a nullable String a parameter and an optional String that
  /// can be customised as the returned error message.
  ///
  /// Returns a nullable String that can be used a `TextField` validator
  /// parameter.
  static String? validate(String? phone, [String? errorMessage]) {
    if (phone == null) return errorMessage ?? _defaultErrorMessage;

    if (_nigeriaPhoneNumberRegExp.hasMatch(phone)) {
      return null;
    } else {
      return errorMessage ?? _defaultErrorMessage;
    }
  }

  /// Returns a sanitised form of the phone number (234XXXXXXXXXX),
  ///
  /// Throws a [FormatException] if validation fails.
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
