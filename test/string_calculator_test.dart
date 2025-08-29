import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Should return 0 for empty string', () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add(""), 0);
  });

  test('Should return number itself for single number', () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add("5"), equals(5));
  });

  test('Should sum two comma-separated numbers', () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add("1,5"), equals(6));
  });

  test('Should handle multiple numbers', () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add("1,2,3,4"), equals(10));
  });
}
