import 'package:string_calculator/string_calculator.dart';

void main(List<String> arguments) {
  print(
    'Result: ${StringCalculator().add(arguments.isNotEmpty ? arguments[0] : '')}',
  );
}
