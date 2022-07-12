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

    test("A living cell with 0 neighbour dies", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 0);
      expect(cell, toBeDead);
    });
  });

  group("A living cell with two or three neighbours lives on to the next generation", () {
    test("A living cell with 2 neighbour lives", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 2);
      expect(cell, toBeAlive);
    });
    test("A living cell with 3 neighbour lives", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 3);
      expect(cell, toBeAlive);
    });
  });

  group("A living cell with more than three live neighbours dies", () {
    test("A living cell with 4 neighbours dies", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 4);
      expect(cell, toBeDead);
    });
    test("A living cell with 5 neighbours dies", () {
      var cell = ConwaysLifeAlgorithm().isAlive(true, 5);
      expect(cell, toBeDead);
    });
  });

  group("A dead cell with exactly three live neighbours becomes a live cell", () {
    test("A dead cell with 3 neighbours lives", () {
      var cell = ConwaysLifeAlgorithm().isAlive(false, 3);
      expect(cell, toBeAlive);
    });
    test("A dead cell with 2 neighbours stays dead", () {
      var cell = ConwaysLifeAlgorithm().isAlive(false, 2);
      expect(cell, toBeDead);
    });
    test("A dead cell with 4 neighbours stays dead", () {
      var cell = ConwaysLifeAlgorithm().isAlive(false, 4);
      expect(cell, toBeDead);
    });
  });
}
