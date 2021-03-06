import 'package:flutter/material.dart';
import 'package:converter/constants.dart';

final controller = TextEditingController();

class ButtonsValueScreen extends StatelessWidget {
  const ButtonsValueScreen(
      {Key key, this.number, this.function, this.isVisible = true})
      : super(key: key);

  final String number;
  final Function function;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isVisible ? function : null,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: kWhiteColor.withOpacity(0.2)),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            number,
            style: TextStyle(color: kWhiteColor, fontSize: 25.0),
          ),
        ),
      ),
    );
  }
}
