

import 'dart:math';

class Formulas {

  
//COnvertir  Binario a decimal
  String binarioDecimal(String binary) {
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
  String decimalHexadecimal(String value) {
    double decimalDoubleValue, division, resto;
    int i = 0;
    List<int> finalNumbers = [];
    String finalNumber = '';
    decimalDoubleValue = double.parse(value);
   
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
  String hexadecimalDecimal(String hexadecimal) {
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
  //COnvertir  Decimal a Binario
  String decimalBinario(String decimal) {
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
}