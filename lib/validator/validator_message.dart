import 'package:password_field_validator/validator/enum_valdation.dart';
import 'package:password_field_validator/validator/string_validation.dart';

final Map<Validation, String> validatorMessage = {
  Validation.atLeast: StringValidation.atLeast,
  Validation.uppercase: StringValidation.uppercase,
  Validation.lowercase: StringValidation.lowercase,
  Validation.numericCharacter: StringValidation.numericCharacter,
  Validation.specialCharacter: StringValidation.specialCharacter,
};
