import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/calculator.dart';


void main() {
  test("Input empty string return 0", (){
    var sum = Calculator.add("");
    expect(sum,0);
  });
}