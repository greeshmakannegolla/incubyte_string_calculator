class StringCalculator {
  int add(String input) {
    if (input.isEmpty) return 0;

    String body = input;
    final delimiters = <String>[',', '\n'];

    if (input.startsWith('//')) {
      final delimiterEndIndex = input.indexOf('\n');
      if (delimiterEndIndex == -1) {
        throw ArgumentError(
          'Invalid input: custom delimiter line must end with \\n',
        );
      }

      final delimiterPattern = input.substring(2, delimiterEndIndex);

      if (delimiterPattern.isEmpty) {
        throw ArgumentError('Invalid input: empty custom delimiter');
      }

      final regex = RegExp(r'\[(.*?)\]');
      final matches = regex.allMatches(delimiterPattern);

      if (matches.isNotEmpty) {
        for (final m in matches) {
          delimiters.add(m.group(1)!);
        }
      } else {
        delimiters.add(delimiterPattern);
      }
      body = input.substring(delimiterEndIndex + 1);
    }

    final pattern = RegExp(delimiters.map(_escapeForRegex).join('|'));
    final numbers = body
        .split(pattern)
        .where((s) => s.trim().isNotEmpty)
        .map(int.parse)
        .toList();

    final negatives = numbers.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw ArgumentError(
        'negative numbers not allowed ${negatives.join(',')}',
      );
    }

    int sum = numbers.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);

    return sum;
  }

  String _escapeForRegex(String s) => RegExp.escape(s);
}
