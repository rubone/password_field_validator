class Strings {
  static const atLeast = 'At lest character';
  static const uppercase = 'Uppercase letter';
  static const lowercase = 'Lowercase letter';
  static const numericCharacter = 'Numeric character';
  static const specialCharacter = 'Special character';
}

enum Validation {
  atLeast,
  uppercase,
  lowercase,
  numericCharacter,
  specialCharacter
}

final Map<Validation, String> validatorMessage = {
  Validation.atLeast: Strings.atLeast,
  Validation.uppercase: Strings.uppercase,
  Validation.lowercase: Strings.lowercase,
  Validation.numericCharacter: Strings.numericCharacter,
  Validation.specialCharacter: Strings.specialCharacter,
};
