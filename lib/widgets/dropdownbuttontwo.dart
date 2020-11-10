import 'package:converter/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:converter/Controllers/globalcontroller.dart';

class DropDownItemButtonTwo extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      id: "ItemDropDown2",
      builder: (_) => Center(
        child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.arrow_downward, color: kMainColor,),
            dropdownColor:  kWhiteColor,
            value: _.valueDrop2,
            items: _.listItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color:  kMainColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
            onChanged: (String value){
               _.updateDropDown2(value);
            }
          ),
        ),
      ),
    );
  }
}
