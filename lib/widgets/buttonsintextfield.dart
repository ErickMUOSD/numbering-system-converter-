import 'package:flutter/material.dart';
import 'package:converter/constants.dart';

final controller = TextEditingController();

class ButtonsValueScreen extends StatelessWidget {
  const ButtonsValueScreen(
      {Key key,
      this.number,
      this.colorLast = false,
      this.function,
      @required this.isVisible = true})
      : super(key: key);

  final String number;
  final Function function;
  final bool colorLast;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isVisible ? function : null,
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
