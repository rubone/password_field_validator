import 'package:flutter/material.dart';

@immutable
class ValidatorItemWidget extends StatelessWidget {
  final String text;
  final int conditionValue;
  final Color color;
  final bool value;
  final Color? textColor;

  const ValidatorItemWidget(
      this.text, this.conditionValue, this.color, this.value, this.textColor,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Container(
            child: value
                ? Icon(
                    Icons.check_circle_outline,
                    color: color,
                  )
                : Icon(
                    Icons.close_outlined,
                    color: color,
                  ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: textColor == null ?
            Text(
              '$text (${conditionValue.toString()})',
            ) : Text(
              '$text (${conditionValue.toString()})',
              style: TextStyle(
                color: textColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
