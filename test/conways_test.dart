import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_intro/conways_life_algorithm.dart';

const Matcher toBeDead = isFalse;
const Matcher toBeAlive = isTrue;

void main() {
  group("A living cell with fewer than two neighbours die", () {
    test("A living cell with 1 neighbour dies", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 1);
      expect(cell, toBeDead);
    });
  });
}
