import 'package:converter/Controllers/valuescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:converter/constants.dart';
import 'package:get/get.dart';
import 'package:converter/widgets/buttonsintextfield.dart';

class AddValueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddValueScreenController>(
      init: AddValueScreenController(),
      builder: (_) => SafeArea(
        child: Material(
          color: kMainColor,
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          _.controller.clear();
                        },
                        child: Text(
                          'Tap to delete',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: kWhiteColor.withOpacity(0.5)),
                        ),
                      ),
                    ),
                    GetBuilder<AddValueScreenController>(
                      id: 'Controller',
                      builder: (_) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          controller: _.controller,
                          textAlign: TextAlign.center,
                          showCursor: true,
                          readOnly: true,
                          autofocus: true,
                          cursorColor: kWhiteColor,
                          style: TextStyle(
                            fontSize: 60.0,
                            color: kWhiteColor,
                          ),
                          decoration: decorationTextFiled,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: GetBuilder<AddValueScreenController>(
                  builder: (_) => GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.7,
                      mainAxisSpacing: 15.0,
                      crossAxisSpacing: 5.0,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    itemCount: _.buttons.length,
                    itemBuilder: (context, index) {
                 
                   return ButtonsValueScreen(
                          isVisible: _.isEnabled(index),
                          number: _.buttons[index],
                          function: () {
                            _.buttons[index] != '✔' ?_.writeValue(_.buttons[index]) : _.goBackWithData();
                            
                          },
                        );
                    },
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Container(
              //     child: GetBuilder<AddValueScreenController>(
              //       builder: (_) => Row(
              //         mainAxisSize: MainAxisSize.max,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: <Widget>[
              //           ButtonsValueScreen(
              //             number: '0',
              //             function: () {
              //               _.writeValue('0');
              //             },
              //           ),
              //           ButtonsValueScreen(
              //             isVisible: true,
              //             number: '✔',
              //             colorLast: true,
              //             function: () {
              //               _.goBackWithData();
              //             },
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
