import 'package:flutter_test/flutter_test.dart';
import 'package:nigerian_phone_number_validator/nigerian_phone_number_validator.dart';

void main() {
  group('Invalid phone numbers', () {
    test('validate() returns an error message for non-digits', () {
      expect(
        NigerianPhoneNumberValidator.validate('xxxxxx'),
        'Phone number is invalid',
      );
    });

    test(
        'validate() returns an error message for incomplete number starting with zero',
        () {
      expect(
        NigerianPhoneNumberValidator.validate('08184623'),
        'Phone number is invalid',
      );
    });

    test(
        'validate() returns an error message for incomplete numbers starting with +234',
        () {
      expect(
        NigerianPhoneNumberValidator.validate('+23408184623'),
        'Phone number is invalid',
      );
    });
  });

  group('Valid phone numbers', () {
    test('validate() returns null for a valid phone starting with 0', () {
      expect(
        NigerianPhoneNumberValidator.validate('08139854263'),
        null,
      );
    });

    test('validate() returns null for a valid phone number starting with +234',
        () {
      expect(
        NigerianPhoneNumberValidator.validate('+2348184623529'),
        null,
      );
    });
  });

  group('Sanitise phone numbers', () {
    test('sanitise() returns formatted phone number', () {
      expect(
        NigerianPhoneNumberValidator.sanitise('08139854263'),
        '2348139854263',
      );
    });

    test(
        'sanitise() returns sanitised number for a phone number starting with +234',
        () {
      expect(
        NigerianPhoneNumberValidator.sanitise('+2348139854263'),
        '2348139854263',
      );
    });
  });
}
