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
}
