class Calculator {
  static int add(String number) {
    var numberList = splitIntoNumbers(number);
    switch (numberList.length) {
      case 1:
        return _convertStringToInt(number);
      case 2:
        return _convertStringToInt(numberList[0]) + _convertStringToInt(numberList[1]);
    }
  }

  static List<String> splitIntoNumbers(String number) => number.split(",");

  static int _convertStringToInt(String number) => int.tryParse(number) ?? 0;
}
