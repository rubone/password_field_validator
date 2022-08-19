import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:password_field_validator/validator/validator.dart';

void main() {
  late Validator validator;

  setUp(() {
    validator = Validator();
  });

  test(
      'Should return false when minimum length is 8 and password has 6 characters',
      () {
    // Arrange
    String password = 'reto45';
    int minLength = 8;

    // Act
    bool result = validator.hasMinimumLength(password, minLength);

    // Assert
    expect(result, false);
  });

  test(
      'Should return true when minimum lenght is 8 and password has 9 characters',
      () {
    // Arrange
    String password = 'aratho988';
    int minLenght = 8;

    // Act
    bool result = validator.hasMinimumLength(password, minLenght);

    // Assert
    expect(result, true);
  });

  test(
      'Should return false when minimum special charactes is 3 and password has 2 special characters',
      () {
    // Arrange
    String password = 'demO^&';
    int specialCharactersCount = 3;

    // Act
    bool result =
        validator.hasMinimumSpecialCharacters(password, specialCharactersCount);

    // Assert
    expect(result, false);
  });

  test(
      'Should return true when minimum special charcters is 2 and password has 3 special characters',
      () {
    // Arrange
    String password = 'demo23&*#';
    int specialCharactersCount = 2;

    // Act
    bool result =
        validator.hasMinimumSpecialCharacters(password, specialCharactersCount);

    // Assert
    expect(result, true);
  });

  test(
      'Should return true when minimun uppercase is 2 and password has 3 uppercase letter',
      () {
    // Arrange
    String password = 'ExampLE90';
    int uppercaseCount = 2;

    // Act
    bool result = validator.hasMinimumUppercase(password, uppercaseCount);

    // Assert
    expect(result, true);
  });

  test(
      'Should return false when minimum uppercase is 1 and password has 0 uppercase letter',
      () {
    // Arrange
    String password = 'example12*';
    int uppercaseCount = 1;

    // Act
    bool result = validator.hasMinimumUppercase(password, uppercaseCount);

    // Assert
    expect(result, false);
  });

  test(
      'Should return true when minimum lowercase is 5 and password has 8 lowercase letter',
      () {
    // Arrange
    String password = 'examples';
    int lowercaseCount = 5;

    // Act
    bool result = validator.hasMinimumLowercase(password, lowercaseCount);

    // Assert
    expect(result, true);
  });

  test(
      'Should return false when minimum lowercase is 5 and password has 4 lowercase letter',
      () {
    // Arrange
    String password = 'exam*';
    int lowercaseCount = 5;

    // Act
    bool result = validator.hasMinimumLowercase(password, lowercaseCount);

    // Assert
    expect(result, false);
  });

  test(
      'Should return true when minimum numeric chracter is 2 and password has 2 numeric character',
      () {
    // Arrange
    String password = 'example17';
    int numericCount = 2;

    // Act
    bool result = validator.hasMinimumNumericCharacters(password, numericCount);

    // Assert
    expect(result, true);
  });

  test(
      'Should return false when minimum numeric character is 2 and password has 1 numeric character ',
      () {
    // Arrange
    String password = 'Example1';
    int numericCount = 2;

    // Act
    bool result = validator.hasMinimumNumericCharacters(password, numericCount);

    // Assert
    expect(result, false);
  });
}
