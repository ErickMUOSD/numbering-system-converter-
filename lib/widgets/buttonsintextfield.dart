import 'package:flutter/material.dart';
import 'package:converter/constants.dart';
class ButtonsInTextField extends StatelessWidget {
  const ButtonsInTextField(
      {Key key, this.number, this.colorLast = false, this.function})
      : super(key: key);

  final String number;
  final Function function;
  final bool colorLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorLast ? kWhiteColor : kWhiteColor.withOpacity(0.2)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            number,
            style: TextStyle(
                color: colorLast ? kMainColor : kWhiteColor, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
