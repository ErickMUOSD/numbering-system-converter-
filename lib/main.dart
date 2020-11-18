
import 'package:flutter/material.dart';
import 'package:converter/Screens/HomePage.dart';
import 'package:get/get.dart';
import 'constants.dart';
import 'package:converter/Controllers/homecontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kWhiteColor),
      home: HomePage(),
      // getPages: [
      //   GetPage(name: '/', page: () => HomePage()),
      //   GetPage(name: '/second', page: () => AddValueScreen()),
      // ],
    );
  }
}
