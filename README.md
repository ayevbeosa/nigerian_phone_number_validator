# Nigerian Phone Number Validator

A light-weight package to validate Nigerian phone numbers.
Specifically, designed for validating phone number in a `TextFormField` widget.

## Features

* Validate Nigerian phone numbers
* Sanitise phone number to international format

## Getting started

### Installing

```yaml
dependencies:
  nigerian_phone_number_validator: ^0.0.1
```

### Usage

```dart
TextFormField(
  validator: NigerianPhoneNumberValidator.validate,
),
```

Alternatively, you can set your own error message.
```dart
TextFormField(
  validator: (value) {
    return NigerianPhoneNumberValidator.validate(
      value,
      'Please use a valid phone number',
    );
  },
),
```

## Additional information

Contributions and suggestions are welcome. Feel free to send a PR for additional features
