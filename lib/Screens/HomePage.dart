import 'package:converter/Controllers/globalcontroller.dart';

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

    return GetBuilder<GlobalController>(
      init: GlobalController(),
      builder: (_) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: <Widget>[
            CustomPaint(
              size: Size.fromHeight(sizeH * 0.6), //2
              painter: ButtonPainter(avatarRadius: 40, color: kMainColor), //3
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
                    child: GetBuilder<GlobalController>(
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
                GetBuilder<GlobalController>(
                  id: 'TextOfTexfield',
                  builder: (_) => InkWell(
                    onTap: () {
                      _.getData();
                    },
                    child: Text(
                      _.textoftextfield1,
                      style: TextStyle(
                          fontSize: 30,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ),
                GetBuilder<GlobalController>(
                  builder: (_) => GestureDetector(
                    onTap: () {},
                    child: Text(
                      'EUR',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: kWhiteColor.withOpacity(0.5),
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.0,
                ),
                Text('USD',
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: kMainColor.withOpacity(0.5),
                        )),
                GetBuilder<GlobalController>(
                  id: 'TextOfTexfield',
                  builder: (_
                  ) => Text(_.textotextfield2,
                      style: TextStyle(fontSize: 30.0, color: kMainColor),
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
