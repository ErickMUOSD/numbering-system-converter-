import 'package:converter/Controllers/valuescreencontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:converter/constants.dart';
import 'package:get/get.dart';
import 'package:converter/widgets/buttonsintextfield.dart';

class AddValueScreen extends StatelessWidget {
//   Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = Offset(0.0, 1.0);
//       var end = Offset.zero;
//       var curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

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
                height: 140.0,
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
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 10.0, left: 20.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kColorTransparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kColorTransparent),
                            ),
                          ),
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
                      return ButtonsInTextField(
                        number: _.buttons[index],
                        function: () {
                        
                          _.writeValue(_.buttons[index]);
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: GetBuilder<AddValueScreenController>(
                    builder: (_) => Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonsInTextField(
                          number: '.',
                          function: () {
                            _.writeValue('.');
                          },
                        ),
                        ButtonsInTextField(
                          number: '0',
                          function: () {
                            _.writeValue('0');
                          },
                        ),
                        ButtonsInTextField(
                          number: '✔',
                          colorLast: true,
                          function: () {
                            _.goBackWithData();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
