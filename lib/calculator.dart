class Calculator {
  static int add(String number) {
    final numbers = splitIntoNumbers(number);
    if (_hasOneNumber(numbers)) {
      return _convertStringToInt(number);
    }
    return _convertStringToInt(numbers.first)
        + _convertStringToInt(numbers.last);
  }

  static bool _hasOneNumber(List<String> numbers) => numbers.length == 1;

  static List<String> splitIntoNumbers(String number) => number.split(",");

  static int _convertStringToInt(String number) => int.tryParse(number) ?? 0;
}
