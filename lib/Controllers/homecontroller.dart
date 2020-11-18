import 'dart:math';
import 'package:converter/Screens/add_value_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String _textTextField1 = '100';
  String _textTextField2 = '400';
  String _valueDrop1 = 'Binario';
  String _valueDrop2 = 'Decimal';
  bool _arrowDirectionP = true;
  List<String> _listItems = [
    "Binario",
    "Decimal",
    "Hexadecimal",
  ];

  List<String> get listItems => _listItems;
  bool get arrowDirection => _arrowDirectionP;
  String get textoftextfield1 => _textTextField1;
  String get textotextfield2 => _textTextField2;
  String get valueDrop1 => _valueDrop1;
  String get valueDrop2 => _valueDrop2;

  @override
  onInit() {
    chooseoption(_valueDrop1, _valueDrop2);
  }

  updateDropDown1(String value) {
    _valueDrop1 = value;
    chooseoption(_valueDrop1, _valueDrop2);
    update(['ItemDropDown1']);
  }

  updateDropDown2(String value) {
    _valueDrop2 = value;
    chooseoption(_valueDrop1, _valueDrop2);
    update(['ItemDropDown2']);
  }

  void invertValuesListAndText() {
    String valueList1, valueList2;
    String valueText1, valueText2;
    valueList1 = _valueDrop1;
    valueList2 = _valueDrop2;
    _valueDrop1 = valueList2;
    _valueDrop2 = valueList1;

    valueText1 = _textTextField1;
    valueText2 = _textTextField2;
    _textTextField1 = valueText2;
    _textTextField2 = valueText1;

    _arrowDirectionP = !_arrowDirectionP;

    chooseoption(_valueDrop1, _valueDrop2);
    update([
      'ChangeValueslist',
      'ItemDropDown1',
      'ItemDropDown2',
      'TextOfTexfield'
    ]);
  }

  getData() async {
    _textTextField1 =
        await Get.to<String>(AddValueScreen(), arguments: valueDrop1);
    if (_textTextField1 == null) {
      _textTextField1 = '100';
    }
    update(['TextOfTextfield']);
  }

  void chooseoption(String option1, String option2) {
    if (option1 == 'Decimal' && option2 == 'Binario') {
      print('Decimal-Binario');
      _textTextField2 = _decimalBinario(_textTextField1);
    } else if (option1 == 'Binario' && option2 == 'Decimal') {
        print('Binario-Decimal');
      _textTextField2 = _binarioDecimal(_textTextField1);
    } else if (option1 == 'Decimal' && option2 == 'Hexadecimal') {
       print('Decimal-Hexadecimal');
      _textTextField2 = _decimalHexadecimal(_textTextField1);
    } else if (option1 == 'Hexadecimal' && option2 == 'Decimal') {
       print('Hexadecimal-Decimal');
      _textTextField2 = _hexadecimalDecimal(_textTextField1);
    }
    update(['TextOfTextfield']);
  }

//COnvertir  Decimal a Binario
  String _decimalBinario(String decimal) {
    double binaryValue = double.parse(decimal);
    double resto;
    double division;
    String finalNumber = '';
    while (binaryValue != 0) {
      division = binaryValue / 2;
      resto = binaryValue % 2;

      binaryValue = division.truncate().toDouble();
      finalNumber += '${resto.truncate()}';
    }
    print('Decimal Binario ${finalNumber.split('').reversed.join().trim()}');
    print('DB ${finalNumber.length}');
    print(finalNumber);
    return finalNumber.split('').reversed.join();
  }

//COnvertir  Binario a decimal
  String _binarioDecimal(String binary) {
    List<String> _listStringBinary = [];
    List<int> _listIntBinary = [];
    int counter = 0;

    int finalNumber = 0;
    int numberAux = 0;

    _listStringBinary = binary.split('');
    _listIntBinary = _listStringBinary.map(int.parse).toList();

    _listIntBinary = _listIntBinary.reversed.toList();

    while (counter < _listIntBinary.length) {
      numberAux = _listIntBinary[counter] * pow(2, counter);

      finalNumber += numberAux;

      counter++;
    }
   

    return finalNumber.toString();
  }

//COnvertir  Decimal Hexadecimal
  String _decimalHexadecimal(String value) {
    double decimalDoubleValue, division, resto;
    int i;
    List<int> finalNumbers = [];
    String finalNumber = '';
    decimalDoubleValue = double.parse(value);
    i = 0;
    if (decimalDoubleValue >= 16) {
      division = decimalDoubleValue / 16;
      while (division >= 16) {
        division = decimalDoubleValue / 16;

        resto = decimalDoubleValue % 16;

        decimalDoubleValue = division;
        finalNumbers.add(resto.truncate());
        i++;
      }
      finalNumbers.add(division.truncate());
    } else {
      finalNumbers.add(decimalDoubleValue.truncate());
    }

    for (var i = finalNumbers.length - 1; i >= 0; i--) {
      switch (finalNumbers[i]) {
        case 10:
          finalNumber += 'A';
          break;
        case 11:
          finalNumber += 'B';
          break;
        case 12:
          finalNumber += 'C';
          break;
        case 13:
          finalNumber += 'D';
          break;
        case 14:
          finalNumber += 'E';
          break;
        case 15:
          finalNumber += 'F';
          break;
        default:
          finalNumber += finalNumbers[i].toString();
      }
    }
    return finalNumber;
  }

//COnvertir Hexadecimal a Decimal
  String _hexadecimalDecimal(String hexadecimal) {
    List<String> listStringHex = [];
    List<int> listIntHex = [];
    int counter = 0;
    int finalNumber = 0;
    int numberAux = 0;

    listStringHex = hexadecimal.split('');
    for (var i = listStringHex.length - 1; i >= 0; i--) {
      switch (listStringHex[i]) {
        case 'A':
          listIntHex.add(10);
          break;
        case 'B':
          listIntHex.add(11);
          break;
        case 'C':
          listIntHex.add(12);
          break;
        case 'D':
          listIntHex.add(13);
          break;
        case 'E':
          listIntHex.add(14);
          break;
        case 'F':
          listIntHex.add(15);
          break;
        default:
          listIntHex.add(int.parse(listStringHex[i]));
      }
    }
    while (counter < listIntHex.length) {
      numberAux = listIntHex[counter] * pow(16, counter);
      finalNumber += numberAux;
      counter++;
    }

    return finalNumber.toString();
  }
}
