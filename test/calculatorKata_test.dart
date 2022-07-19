import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/calculator.dart';


void main() {
  group("Empty String",() {
    test("Input empty string return 0", (){
      var sum = Calculator.add("");
      expect(sum,0);
    });
  });
   group("One number input",() {
     test("Input is 1 return the same number", (){
       var sum = Calculator.add("1");
       expect(sum,1);
     });
     test("Input is 2 return the same number", (){
       var sum = Calculator.add("2");
       expect(sum,2);
     });
  });

  group("Input is two numbers", () {
    test("Input are 1,2 return the 3", (){
      var sum = Calculator.add("1,2");
      expect(sum,3);
    });
  });

}