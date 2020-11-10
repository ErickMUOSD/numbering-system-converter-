import 'package:get/get.dart';
import 'package:flutter/material.dart';
class AddValueScreenController extends GetxController {
  String  text;
 
  List<String> _buttons = ['1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'];
    List<String>  get buttons => _buttons;
  final controller =  TextEditingController();
  

  @override
  void onInit() {
    
    super.onInit();
    
  
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

  
  void writeValue(String value){
    controller.text += value;
    update(['Controller']);
  }
  void goBackWithData(){
    print('back data ${controller.text}');
    if(controller.text.isNotEmpty){
      Get.back(result: controller.text.trim());
    }else{
   
    }
  }
}
