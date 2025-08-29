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

  group('Newlines as delimiters in addition to commas', () {
    final stringCalculator = StringCalculator();

    test('Should handle single newline and commas', () {
      expect(stringCalculator.add('1\n2,3'), 6);
    });

    test('Should handle multiple newlines and commas', () {
      expect(stringCalculator.add('1\n2\n3,4'), 10);
    });
  });

  group('Custom delimiter(s)', () {
    final stringCalculator = StringCalculator();

    test('Should handle custom delimiter', () {
      expect(stringCalculator.add('//;\n1;2'), 3);
    });

    test(
      'Should still accept commas and newlines along with custom delimiters',
      () {
        expect(stringCalculator.add('//|\n1|2,3\n4'), 10);
      },
    );

    test('Should throw error when custom delimiter line has no newline', () {
      expect(
        () => stringCalculator.add('//;123'),
        throwsA(
          predicate(
            (e) =>
                e is ArgumentError &&
                e.message ==
                    'Invalid input: custom delimiter line must end with \\n',
          ),
        ),
      );
    });

    test(
      'Should throw error when custom delimiter line has empty custom delimiter',
      () {
        expect(
          () => stringCalculator.add('//\n1,2'),
          throwsA(
            predicate(
              (e) =>
                  e is ArgumentError &&
                  e.message == 'Invalid input: empty custom delimiter',
            ),
          ),
        );
      },
    );
  });
}
