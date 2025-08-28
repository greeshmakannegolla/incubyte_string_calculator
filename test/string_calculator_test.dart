import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  test('Should return 0 for empty string', () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add(""), 0);
  });
}
