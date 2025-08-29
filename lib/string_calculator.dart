class StringCalculator {
  //static int _count = 0;
  int add(String input) {
    //_count++;
    if (input.isEmpty) return 0;

    String body = input;
    //Start with default delimiters
    final delimiters = <String>[',', '\n'];

    //Handle custom delimiters
    if (input.startsWith('//')) {
      final delimiterEndIndex = input.indexOf('\n');
      if (delimiterEndIndex == -1) {
        throw ArgumentError(
          'Invalid input: custom delimiter line must end with \\n',
        );
      }

      //Extract custom delimiter
      final delimiterPattern = input.substring(2, delimiterEndIndex);

      if (delimiterPattern.isEmpty) {
        throw ArgumentError('Invalid input: empty custom delimiter');
      }

      //Regex to identify multichar and multiple delimiters
      final regex = RegExp(r'\[(.*?)\]');
      final matches = regex.allMatches(delimiterPattern);

      //Extract multichar and multiple delimiters
      if (matches.isNotEmpty) {
        for (final m in matches) {
          delimiters.add(m.group(1)!);
        }
      } else {
        delimiters.add(delimiterPattern);
      }
      body = input.substring(delimiterEndIndex + 1);
    }

    //Create final regex with all identified delimiters
    final pattern = RegExp(delimiters.map(RegExp.escape).join('|'));

    //Extract all numbers
    final numbers = body
        .split(pattern)
        .where((s) => s.trim().isNotEmpty)
        .map(int.parse)
        .toList();

    //Identify negatives
    final negatives = numbers.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw ArgumentError(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    //Sum all numbers ignoring numbers greater than 1000
    int sum = numbers.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);

    return sum;
  }

  // Functional, but commented as usecase is not clear
  // int getCalledCount() {
  //   return _count;
  // }
}
