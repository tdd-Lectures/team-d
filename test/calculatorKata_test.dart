import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/calculator.dart';

void main() {

  test("Adding '' returns 0", () {
    var sum = Calculator.add("");
    expect(sum, 0);
  });
  group("Adding from a string with 1 number", () {
    test("Adding '1' returns 1", () {
      var sum = Calculator.add("1");
      expect(sum, 1);
    });
    test("Adding '2' returns 2", () {
      var sum = Calculator.add("2");
      expect(sum, 2);
    });
    test("Adding 'a' returns 0", (){
      var sum = Calculator.add('a');
      expect(sum,0);
    });
  });

  group("Adding from a string with two numbers", () {
    test("Adding '1,2' returns 3", () {
      var sum = Calculator.add("1,2");
      expect(sum, 3);
    });
    test("Adding '2,2' returns  4", () {
      var sum = Calculator.add("2,2");
      expect(sum, 4);
    });
    test("Adding ',1' returns 1", () {
      var sum = Calculator.add(",1");
      expect(sum, 1);
    });
    test("Adding '1,' returns 1", () {
      var sum = Calculator.add("1,");
      expect(sum, 1);
    });

    test("Adding '1,a' returns 1", () {
      var sum = Calculator.add("1,a");
      expect(sum, 1);
    });

    test("Adding 'a,1' returns 1", () {
      var sum = Calculator.add("a,1");
      expect(sum, 1);
    });

    test("Adding 'a,a' returns 0", () {
      var sum = Calculator.add("a,a");
      expect(sum, 0);
    });

    test("Adding 'aa' returns 0", () {
      var sum = Calculator.add("aa");
      expect(sum, 0);
    });

  });



}
