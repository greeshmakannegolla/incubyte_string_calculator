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
}
