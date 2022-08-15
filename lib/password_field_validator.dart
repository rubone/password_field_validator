import 'package:flutter/material.dart';
import 'package:password_field_validator/components/validator_item.dart';
import 'package:password_field_validator/validator/strings.dart';
import 'package:password_field_validator/validator/validator.dart';

class PasswordFieldValidator extends StatefulWidget {
  final int minLength,
      uppercaseCharCount,
      lowercaseCharCount,
      numericCharCount,
      specialCharCount;

  final Color defaultColor, successColor, failureColor;
  final TextEditingController controller;

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
      required this.controller})
      : super(key: key);

  @override
  _PasswordFieldValidatorState createState() => _PasswordFieldValidatorState();
}

class _PasswordFieldValidatorState extends State<PasswordFieldValidator> {
  final Map<String, bool> _selectedCondition = {
    Strings.atLeast: false,
    Strings.uppercase: false,
    Strings.lowercase: false,
    Strings.numericCharacter: false,
    Strings.specialCharacter: false,
  };

  late bool isFirstRun;

  void validate() {
    _selectedCondition[Strings.atLeast] = Validator().hasMinimunLength(
      widget.controller.text,
      widget.minLength,
    );

    _selectedCondition[Strings.uppercase] = Validator().hasMinimumUppercase(
      widget.controller.text,
      widget.uppercaseCharCount,
    );

    _selectedCondition[Strings.lowercase] = Validator().hasMinimumLowercase(
      widget.controller.text,
      widget.lowercaseCharCount,
    );

    _selectedCondition[Strings.numericCharacter] =
        Validator().hasMinimumNumericCharacters(
      widget.controller.text,
      widget.numericCharCount,
    );

    _selectedCondition[Strings.specialCharacter] =
        Validator().hasMinimumSpecialCharacters(
      widget.controller.text,
      widget.specialCharCount,
    );

    setState(() => null);
  }

  @override
  void initState() {
    super.initState();
    isFirstRun = true;

    //Adds a listener callback on TextField
    widget.controller.addListener(() {
      isFirstRun = false;
      validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: _selectedCondition.entries.map((entry) {
          int conditionValue = 0;
          if (entry.key == Strings.atLeast) {
            conditionValue = widget.minLength;
          }
          if (entry.key == Strings.uppercase) {
            conditionValue = widget.uppercaseCharCount;
          }
          if (entry.key == Strings.lowercase) {
            conditionValue = widget.numericCharCount;
          }
          if (entry.key == Strings.numericCharacter) {
            conditionValue = widget.specialCharCount;
          }
          if (entry.key == Strings.specialCharacter) {
            conditionValue = widget.specialCharCount;
          }
          return ValidatorItemWidget(
            entry.key,
            conditionValue,
            isFirstRun
                ? widget.defaultColor
                : entry.value
                    ? widget.successColor
                    : widget.failureColor,
            entry.value,
          );
        }).toList(),
      ),
    );
  }
}
