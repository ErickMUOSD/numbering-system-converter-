import 'package:converter/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:converter/Controllers/globalcontroller.dart';

class DropDownItemButtonOne extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: "ItemDropDown1",
      builder: (_) => Center(
        child: DropdownButtonHideUnderline(

                  child: DropdownButton<String>(
                    icon: Icon(Icons.arrow_downward, color: kWhiteColor,),
            dropdownColor:  kMainColor ,
            value: _.valueDrop1,
            items: _.listItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color:  kWhiteColor ,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
            onChanged: (String value){
               _.updateDropDown1(value);
            }
          ),
        ),
      ),
    );
  }
}
