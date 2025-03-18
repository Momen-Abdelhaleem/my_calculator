import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  // providerعشان ما حدش يعرف يعدلها برا ال  private هنعمل المتغبرات دي
  String _number1 = '';
  String _operand = '';
  String _number2 = '';
  String _result = '0';
  // عشان اعرف استعملها في باقي التطبيقprivateهنا هنعمل متغيرات عادية بتاخد قيمتها من ال
  String get number1 => _number1;
  String get operand => _operand;
  String get number2 => _number2;
  String get result => _result;
  // void addValue(String value) {
  //   if (_operand.isEmpty) {
  //     _number1 += value;
  //   } else {
  //     _number2 += value;
  //   }
  //   notifyListeners();
  // }

  void addValue(String value) {
    if (value == '+' || value == '-' || value == 'x' || value == '÷') {
      if (_number1.isNotEmpty && _number2.isEmpty) {
        _operand = value;
      }
    } else {
      if (_operand.isEmpty) {
        _number1 += value;
      } else {
        _number2 += value;
      }
    }
    notifyListeners();
  }

  void clear() {
    _number1 = '';
    _number2 = '';
    _operand = '';
    _result = '0';
    notifyListeners();
  }

  void delete() {
    if (_number2.isNotEmpty) {
      _number2 = number2.substring(0, _number2.length - 1);
    } else if (_operand.isNotEmpty) {
      _operand = '';
    } else if (_number1.isNotEmpty) {
      _number1 = number1.substring(0, _number1.length - 1);
    }
    notifyListeners();
  }

  // void calculatePercentage() {
  //   if (_number1.isNotEmpty && _operand.isNotEmpty && _number2.isNotEmpty) {
  //     calculateResult();
  //   }
  //   if (_operand.isNotEmpty) return;
  //   final double percentageResult = double.tryParse(_result) ?? 0;
  //   _result = (percentageResult / 100).toString();
  //   notifyListeners();
  // }

  void calculatePercentage() {
    if (_number1.isNotEmpty && _operand.isEmpty && _number2.isEmpty) {
      final double num1 = double.tryParse(_number1) ?? 0;
      _result = (num1 / 100).toString();
      _number1 = '';
      _operand = '';
      _number2 = '';
      notifyListeners();
    }
  }

  void calculateResult() {
    if (_number1.isEmpty || _number2.isEmpty || _operand.isEmpty) return;
    final double num1 = double.tryParse(_number1) ?? 0;
    final double num2 = double.tryParse(_number2) ?? 0;
    switch (_operand) {
      case '+':
        _result = (num1 + num2).toString();
        break;
      case '-':
        _result = (num1 - num2).toString();
        break;
      case 'x':
        _result = (num1 * num2).toString();
        break;
      case '÷':
        _result = num2 != 0 ? (num1 / num2).toString() : 'Expression Error';
        break;
      default:
        return;
    }
    if (_result.endsWith('.0')) {
      _result = _result.substring(0, _result.length - 2);
    }
    _number1 = '';
    _number2 = '';
    _operand = '';
    notifyListeners();
  }
}
