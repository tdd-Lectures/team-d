
class Calculator {
  static int add(String number){
    if(number.isEmpty){
      return 0;
    }
    return int.parse(number);
  }
}