import 'dart:math';
import 'package:converter/Screens/add_value_screen.dart';
import 'package:get/get.dart';
import 'package:converter/Formulas/formulas.dart';

class HomeController extends GetxController {
  String _valueTextField1 = '100';
  String _valueTextField2 = '400';
  String _valueListDropDown1 = 'Binario';
  String _valueListDropDown2 = 'Decimal';
  bool _arrowDirectionP = true;
 final List<String> _listItems = [
    "Binario",
    "Decimal",
    "Hexadecimal",
  ];
  Formulas getResults = Formulas();
  List<String> get listItems => _listItems;
  bool get arrowDirection => _arrowDirectionP;
  String get valueTextField1 => _valueTextField1;
  String get valueTextField2 => _valueTextField2;
  String get valueListDropDown1 => _valueListDropDown1;
  String get valueListDropDown2 => _valueListDropDown2;

  @override
  onInit() {
    chooseFormula(_valueListDropDown1, _valueListDropDown2);
  }

  updateDropDownList1(String value) {
    _valueListDropDown1 = value;
    chooseFormula(_valueListDropDown1, _valueListDropDown2);
    update(['ItemDropDown1']);
  }

  updateDropDownList2(String value) {
    _valueListDropDown2 = value;
    chooseFormula(_valueListDropDown1, _valueListDropDown2);
    update(['ItemDropDown2']);
  }

  void invertValuesListAndText() {
    String valueList1, valueList2;
    String valueText1, valueText2;

      valueList1 = _valueListDropDown1;
    valueList2 = _valueListDropDown2;
    _valueListDropDown1 = valueList2;
    _valueListDropDown2 = valueList1;

    valueText1 = _valueTextField1;
    valueText2 = _valueTextField2;
    _valueTextField1 = valueText2;
    _valueTextField2 = valueText1;

    _arrowDirectionP = !_arrowDirectionP;

    chooseFormula(_valueListDropDown1, _valueListDropDown2);
    update([
      'ChangeValueslist',
      'ItemDropDown1',
      'ItemDropDown2',
      'TextOfTexfield'
    ]);
  }

  void getDataSecondPage() async {
    _valueTextField1 =
        await Get.to<String>(AddValueScreen(), arguments: valueListDropDown1);
    if (_valueTextField1 == null) {
      _valueTextField1 = '100';
    }
    chooseFormula(_valueListDropDown1, _valueListDropDown2);
    update(['TextOfTextfield']);
  }

  void chooseFormula(String option1, String option2) {
    if (option1 == 'Decimal' && option2 == 'Binario') {
    
      _valueTextField2 = getResults.decimalBinario(_valueTextField1);
    } else if (option1 == 'Binario' && option2 == 'Decimal') {
  
      _valueTextField2 = getResults.binarioDecimal(_valueTextField1);
    } else if (option1 == 'Decimal' && option2 == 'Hexadecimal') {
   
      _valueTextField2 = getResults.decimalHexadecimal(_valueTextField1);
    } else if (option1 == 'Hexadecimal' && option2 == 'Decimal') {
     
      _valueTextField2 = getResults.hexadecimalDecimal(_valueTextField1);
    }
    update(['TextOfTextfield']);
  }
}
