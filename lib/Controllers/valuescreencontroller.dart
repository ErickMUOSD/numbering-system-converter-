import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddValueScreenController extends GetxController {
  final controller = TextEditingController();
  final List<String> _buttons = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    '✔',
  ];

  List<String> get buttons => _buttons;
  String nameButton;

  @override
  void onInit() {
    super.onInit();
    isVisibleButton(Get.arguments);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }

  void isVisibleButton(String isVisible) {
    nameButton = isVisible;
  }

  bool isEnabled(int index) {
    bool value = true;
    if ((nameButton == 'Binario') && (index >= 0 && index <= 1)) {
      return value;
    } else if ((nameButton == 'Decimal') && (index >= 0 && index <= 9)) {
      return value;
    } else if (nameButton == 'Hexadecimal') {
      return value;
    } else if (index == 16) {
      return value;
    }
    return !value;
  }

  void writeValue(String value) {
    controller.text += value;
    update(['Controller']);
  }

  void goBackWithData() {
    print('back data ${controller.text}');
    if (controller.text.isNotEmpty) {
      Get.back(result: controller.text.trim());
    } 
  }
}
