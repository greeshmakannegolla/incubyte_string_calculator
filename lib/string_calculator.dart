class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    final parts = numbers.split(',');
    return parts
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map(int.parse)
        .fold(0, (sum, n) => sum + n);
  }
}
