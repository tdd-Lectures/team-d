class Calculator {
  static int add(String number) {
    if (number.isEmpty) {
      return 0;
    }
    var numberList = number.split(",");
    switch (numberList.length) {
      case 1:
        return int.tryParse(number) ?? 0;
      case 2:
        return add(numberList[0]) + add(numberList[1]);
    }
  }
}
