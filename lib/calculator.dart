class Calculator {
  static int add(String number) {
    final numbers = splitIntoNumbers(number);
    return _convertToInt(numbers).reduce((value, element) => value + element);
  }

  static List<String> splitIntoNumbers(String number) {
    final re = RegExp(_checkDelimiter(number)? "(\n)|(,)|(;)" : "(\n)|(,)" );
    return number.split(re);
  }

  static int _convertStringToInt(String number) => int.tryParse(number) ?? 0;

  static List<int> _convertToInt(List<String> numbers) {
    return numbers.map((e) => _convertStringToInt(e)).toList();
  }

  static bool _checkDelimiter(String number) {
    if(number.startsWith("//")) {
      return true;
    }
    return false;
  }
}
