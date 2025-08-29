class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String body = numbers;
    final delimiters = <String>[',', '\n'];

    if (numbers.startsWith('//')) {
      final delimiterEndIndex = numbers.indexOf('\n');
      if (delimiterEndIndex == -1) {
        throw ArgumentError(
          'Invalid input: custom delimiter line must end with \\n',
        );
      }

      final delimiterPattern = numbers.substring(2, delimiterEndIndex);

      if (delimiterPattern.isEmpty) {
        throw ArgumentError('Invalid input: empty custom delimiter');
      }

      delimiters.add(delimiterPattern);
      body = numbers.substring(delimiterEndIndex + 1);
    }

    final pattern = RegExp(delimiters.map(_escapeForRegex).join('|'));
    final parts = body.split(pattern);

    int sum = parts
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .fold(0, (sum, n) => sum + n);

    return sum;
  }

  String _escapeForRegex(String s) => RegExp.escape(s);
}
