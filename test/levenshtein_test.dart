import 'package:test/test.dart';
import 'package:theory_of_computation/implementations/levenshtein.dart';

void main() {
  final levenshteinAutomaton = const LevenshteinAutomaton();
  final wordAutomaton = levenshteinAutomaton.generateAutomaton('word', 2);

  group('String "word" with distance 2', () {
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
}
