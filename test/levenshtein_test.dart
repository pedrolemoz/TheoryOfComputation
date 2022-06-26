import 'package:test/test.dart';
import 'package:theory_of_computation/implementations/levenshtein.dart';

void main() {
  group('String "word" with distance 2', () {
    final wordAutomaton = LevenshteinAutomaton.generateAutomaton('word', 2);
    test('Should accept the string "word"', () {
      final result = wordAutomaton.evaluate('word');
      expect(result, true);
    });
    test('Should accept the string "wod"', () {
      final result = wordAutomaton.evaluate('wod');
      expect(result, true);
    });
    test('Should accept the string "wood"', () {
      final result = wordAutomaton.evaluate('wood');
      expect(result, true);
    });
    test('Should accept the string "world"', () {
      final result = wordAutomaton.evaluate('world');
      expect(result, true);
    });
    test('Should reject the string "drow"', () {
      final result = wordAutomaton.evaluate('drow');
      expect(result, false);
    });
    test('Should reject the empty string', () {
      final result = wordAutomaton.evaluate('');
      expect(result, false);
    });
    test('Should reject the string "weirdo"', () {
      final result = wordAutomaton.evaluate('weirdo');
      expect(result, false);
    });
    test('Should reject the string "working"', () {
      final result = wordAutomaton.evaluate('working');
      expect(result, false);
    });
    test('Should reject the string "hey"', () {
      final result = wordAutomaton.evaluate('hey');
      expect(result, false);
    });
  });

  group('Data cleaning with distance 1 using a list of strings', () {
    final source = [
      'kurram agency',
      'kuram agency',
      'kurram agency ',
      'kuram agency '
    ];

    test('Should return a set containing only the string "kurram agency"', () {
      final expectedResult = {'kurram agency'};
      final result = LevenshteinAutomaton.removeInconsistencies(
        source: source,
        distance: 1,
      );
      expect(result, expectedResult);
    });
  });
}
