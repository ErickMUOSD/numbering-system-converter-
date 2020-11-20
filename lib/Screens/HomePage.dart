import 'package:converter/Controllers/homecontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../button_painter.dart';
import 'package:converter/widgets/dropdownbuttonone.dart';
import 'package:converter/widgets/dropdownbuttontwo.dart';
import 'package:converter/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeH = Get.height;
    double sizeW = Get.width;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size.fromHeight(sizeH * 0.6), //2
              painter: ButtonPainter(avatarRadius: 35, color: kMainColor), //3
            ),
            Positioned(
              height: sizeH * 1.1,
              width: sizeW * 1,
              child: Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: kMainColor,
                    child: GetBuilder<HomeController>(
                      id: 'ChangeValueslist',
                      builder: (_) => InkWell(
                        onTap: () {
                          _.invertValuesListAndText();
                        },
                        child: Icon(
                          _.arrowDirection
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 65.0,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropDownItemButtonOne(),
                GetBuilder<HomeController>(
                  id: 'TextOfTextfield',
                  builder: (_) => InkWell(
                    onTap: () {
                      _.getDataSecondPage();
                    },
                    child: Text(
                      _.valueTextField1,
                      style: TextStyle(
                        fontSize: 40,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.0,
                ),
                GetBuilder<HomeController>(
                  id: 'TextOfTextfield',
                  builder: (_) => Text(
                    _.valueTextField2,
                    style: TextStyle(fontSize: 40.0, color: kMainColor),
                  ),
                ),
                DropDownItemButtonTwo(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
