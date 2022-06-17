import 'package:test/test.dart';
import 'package:theory_of_computation/dfa.dart';

void main() {
  final dfa = DFA(
    states: ['q0', 'q1', 'q2', 'q3', 'q4'],
    initialState: 'q0',
    finalStates: ['q4'],
    alphabet: ['a', 'b'],
    transitions: {
      'q0': {'a': 'q1', 'b': 'q0'},
      'q1': {'a': 'q2', 'b': 'q0'},
      'q2': {'a': 'q2', 'b': 'q3'},
      'q3': {'a': 'q1', 'b': 'q4'},
      'q4': {'a': 'q4', 'b': 'q4'},
    },
  );

  group('DFA over the set {a, b} that contains the substring "aabb"', () {
    test('Should accept the string "aabb"', () {
      final result = dfa.evaluateExpression('aabb');
      expect(result, true);
    });
    test('Should accept the string "aaabb"', () {
      final result = dfa.evaluateExpression('aaabb');
      expect(result, true);
    });
    test('Should accept the string "aaabbb"', () {
      final result = dfa.evaluateExpression('aaabbb');
      expect(result, true);
    });
    test('Should accept the string "aaaababbbaaabb"', () {
      final result = dfa.evaluateExpression('aaaababbbaaabb');
      expect(result, true);
    });
    test('Should accept the string "ababaababbbbaaabba"', () {
      final result = dfa.evaluateExpression('ababaababbbbaaabba');
      expect(result, true);
    });
    test('Should reject the empty string', () {
      final result = dfa.evaluateExpression('');
      expect(result, false);
    });
    test('Should reject the string "a"', () {
      final result = dfa.evaluateExpression('a');
      expect(result, false);
    });
    test('Should reject the string "ab"', () {
      final result = dfa.evaluateExpression('ab');
      expect(result, false);
    });
    test('Should reject the string "ba"', () {
      final result = dfa.evaluateExpression('ba');
      expect(result, false);
    });
    test('Should reject the string "bab"', () {
      final result = dfa.evaluateExpression('bab');
      expect(result, false);
    });
    test('Should reject the string "baba"', () {
      final result = dfa.evaluateExpression('baba');
      expect(result, false);
    });
    test('Should reject the string "b"', () {
      final result = dfa.evaluateExpression('b');
      expect(result, false);
    });
    test('Should reject the string "abab"', () {
      final result = dfa.evaluateExpression('abab');
      expect(result, false);
    });
    test('Should reject the string "bbaa"', () {
      final result = dfa.evaluateExpression('bbaa');
      expect(result, false);
    });
    test('Should reject the string "abababbababbbab"', () {
      final result = dfa.evaluateExpression('abababbababbbab');
      expect(result, false);
    });
  });
}
