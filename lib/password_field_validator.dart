import 'package:flutter/material.dart';
import 'package:password_field_validator/components/validator_item.dart';
import 'package:password_field_validator/validator/enum_valdation.dart';

import 'package:password_field_validator/validator/validator.dart';
import 'package:password_field_validator/validator/validator_message.dart';

class PasswordFieldValidator extends StatefulWidget {
  final int minLength;
  final int uppercaseCharCount;
  final int lowercaseCharCount;
  final int numericCharCount;
  final int specialCharCount;

  final Color defaultColor;
  final Color successColor;
  final Color failureColor;
  final Color? textColor;
  final TextEditingController controller;

  final String? minLengthMessage;
  final String? uppercaseCharMessage;
  final String? lowercaseMessage;
  final String? numericCharMessage;
  final String? specialCharacterMessage;

  const PasswordFieldValidator(
      {Key? key,
      required this.minLength,
      required this.uppercaseCharCount,
      required this.lowercaseCharCount,
      required this.numericCharCount,
      required this.specialCharCount,
      required this.defaultColor,
      required this.successColor,
      required this.failureColor,
      required this.controller,
      this.textColor,
      this.minLengthMessage,
      this.uppercaseCharMessage,
      this.lowercaseMessage,
      this.numericCharMessage,
      this.specialCharacterMessage})
      : super(key: key);

  @override
  _PasswordFieldValidatorState createState() => _PasswordFieldValidatorState();
}

class _PasswordFieldValidatorState extends State<PasswordFieldValidator> {
  final Map<Validation, bool> _selectedCondition = {
    Validation.atLeast: false,
    Validation.uppercase: false,
    Validation.lowercase: false,
    Validation.numericCharacter: false,
    Validation.specialCharacter: false,
  };

  late bool isFirstRun;

  void validate() {
    _selectedCondition[Validation.atLeast] = Validator().hasMinimumLength(
      widget.controller.text,
      widget.minLength,
    );

    _selectedCondition[Validation.uppercase] = Validator().hasMinimumUppercase(
      widget.controller.text,
      widget.uppercaseCharCount,
    );

    _selectedCondition[Validation.lowercase] = Validator().hasMinimumLowercase(
      widget.controller.text,
      widget.lowercaseCharCount,
    );

    _selectedCondition[Validation.numericCharacter] =
        Validator().hasMinimumNumericCharacters(
      widget.controller.text,
      widget.numericCharCount,
    );

    _selectedCondition[Validation.specialCharacter] =
        Validator().hasMinimumSpecialCharacters(
      widget.controller.text,
      widget.specialCharCount,
    );

    setState(() {
      return;
    });
  }

  @override
  void initState() {
    super.initState();
    isFirstRun = true;

    widget.controller.addListener(() {
      isFirstRun = false;
      validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _selectedCondition.entries.map((entry) {
        int conditionValue = 0;
        String conditionMessage = '';
        if (entry.key == Validation.atLeast) {
          conditionValue = widget.minLength;
          conditionMessage = widget.minLengthMessage ??
              validatorMessage.entries
                  .firstWhere((element) => element.key == Validation.atLeast)
                  .value
                  .toString();
        }
        if (entry.key == Validation.uppercase) {
          conditionValue = widget.uppercaseCharCount;
          conditionMessage = widget.uppercaseCharMessage ??
              validatorMessage.entries
                  .firstWhere((element) => element.key == Validation.uppercase)
                  .value
                  .toString();
        }
        if (entry.key == Validation.lowercase) {
          conditionValue = widget.lowercaseCharCount;
          conditionMessage = widget.lowercaseMessage ??
              validatorMessage.entries
                  .firstWhere((element) => element.key == Validation.lowercase)
                  .value
                  .toString();
        }
        if (entry.key == Validation.numericCharacter) {
          conditionValue = widget.numericCharCount;
          conditionMessage = widget.numericCharMessage ??
              validatorMessage.entries
                  .firstWhere(
                      (element) => element.key == Validation.numericCharacter)
                  .value
                  .toString();
        }
        if (entry.key == Validation.specialCharacter) {
          conditionValue = widget.specialCharCount;
          conditionMessage = widget.specialCharacterMessage ??
              validatorMessage.entries
                  .firstWhere(
                      (element) => element.key == Validation.specialCharacter)
                  .value
                  .toString();
        }
        return ValidatorItemWidget(
          conditionMessage,
          conditionValue,
          isFirstRun
              ? widget.defaultColor
              : entry.value
                  ? widget.successColor
                  : widget.failureColor,
          entry.value,
          widget.textColor
        );
      }).toList(),
    );
  }
}
