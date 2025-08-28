import 'package:string_calculator/string_calculator.dart';

void main({List<String> arguments = const ['']}) {
  print('Result: ${StringCalculator().add(arguments[0])}');
}
