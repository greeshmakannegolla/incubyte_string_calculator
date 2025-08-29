import 'package:string_calculator/string_calculator.dart';
import 'package:test/test.dart';

void main() {
  group('StringCalculator - basics', () {
    final stringCalculator = StringCalculator();
    test('Should return 0 for empty string', () {
      expect(stringCalculator.add(""), 0);
    });

    test('Should return number itself for single number', () {
      expect(stringCalculator.add("5"), equals(5));
    });

    test('Should sum two comma-separated numbers', () {
      expect(stringCalculator.add("1,5"), equals(6));
    });
  });

  group('Any amount of numbers', () {
    final stringCalculator = StringCalculator();

    test('Should handle multiple numbers', () {
      expect(stringCalculator.add("1,2,3,4"), equals(10));
    });

    test('Should handle spaces and extra commas gracefully', () {
      expect(stringCalculator.add(' 1, 2 , , 3 '), 6);
    });
  });
}
