import 'package:test/test.dart';
import 'package:theory_of_computation/dfa.dart';

void main() {
  final dfa1 = DFA(
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

  final dfa2 = DFA(
    states: ['q0', 'q1', 'q2', 'q3', 'q4'],
    initialState: 'q0',
    finalStates: ['q0', 'q1', 'q2', 'q3'],
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
    test('Should reject the string "aabb"', () {
      final result = dfa1.evaluateExpression('aabb');
      expect(result, true);
    });
    test('Should reject the string "aaabb"', () {
      final result = dfa1.evaluateExpression('aaabb');
      expect(result, true);
    });
    test('Should reject the string "aaabbb"', () {
      final result = dfa1.evaluateExpression('aaabbb');
      expect(result, true);
    });
    test('Should reject the string "aaaababbbaaabb"', () {
      final result = dfa1.evaluateExpression('aaaababbbaaabb');
      expect(result, true);
    });
    test('Should reject the string "ababaababbbbaaabba"', () {
      final result = dfa1.evaluateExpression('ababaababbbbaaabba');
      expect(result, true);
    });
    test('Should accept the empty string', () {
      final result = dfa1.evaluateExpression('');
      expect(result, false);
    });
    test('Should accept the string "a"', () {
      final result = dfa1.evaluateExpression('a');
      expect(result, false);
    });
    test('Should accept the string "ab"', () {
      final result = dfa1.evaluateExpression('ab');
      expect(result, false);
    });
    test('Should accept the string "ba"', () {
      final result = dfa1.evaluateExpression('ba');
      expect(result, false);
    });
    test('Should accept the string "bab"', () {
      final result = dfa1.evaluateExpression('bab');
      expect(result, false);
    });
    test('Should accept the string "baba"', () {
      final result = dfa1.evaluateExpression('baba');
      expect(result, false);
    });
    test('Should accept the string "b"', () {
      final result = dfa1.evaluateExpression('b');
      expect(result, false);
    });
    test('Should accept the string "abab"', () {
      final result = dfa1.evaluateExpression('abab');
      expect(result, false);
    });
    test('Should accept the string "bbaa"', () {
      final result = dfa1.evaluateExpression('bbaa');
      expect(result, false);
    });
    test('Should accept the string "abababbababbbab"', () {
      final result = dfa1.evaluateExpression('abababbababbbab');
      expect(result, false);
    });
  });

  group('DFA over the set {a, b} that does not contains the substring "aabb"',
      () {
    test('Should accept the string "aabb"', () {
      final result = dfa2.evaluateExpression('aabb');
      expect(result, false);
    });
    test('Should accept the string "aaabb"', () {
      final result = dfa2.evaluateExpression('aaabb');
      expect(result, false);
    });
    test('Should accept the string "aaabbb"', () {
      final result = dfa2.evaluateExpression('aaabbb');
      expect(result, false);
    });
    test('Should accept the string "aaaababbbaaabb"', () {
      final result = dfa2.evaluateExpression('aaaababbbaaabb');
      expect(result, false);
    });
    test('Should accept the string "ababaababbbbaaabba"', () {
      final result = dfa2.evaluateExpression('ababaababbbbaaabba');
      expect(result, false);
    });
    test('Should reject the empty string', () {
      final result = dfa2.evaluateExpression('');
      expect(result, true);
    });
    test('Should reject the string "a"', () {
      final result = dfa2.evaluateExpression('a');
      expect(result, true);
    });
    test('Should reject the string "ab"', () {
      final result = dfa2.evaluateExpression('ab');
      expect(result, true);
    });
    test('Should reject the string "ba"', () {
      final result = dfa2.evaluateExpression('ba');
      expect(result, true);
    });
    test('Should reject the string "bab"', () {
      final result = dfa2.evaluateExpression('bab');
      expect(result, true);
    });
    test('Should reject the string "baba"', () {
      final result = dfa2.evaluateExpression('baba');
      expect(result, true);
    });
    test('Should reject the string "b"', () {
      final result = dfa2.evaluateExpression('b');
      expect(result, true);
    });
    test('Should reject the string "abab"', () {
      final result = dfa2.evaluateExpression('abab');
      expect(result, true);
    });
    test('Should reject the string "bbaa"', () {
      final result = dfa2.evaluateExpression('bbaa');
      expect(result, true);
    });
    test('Should reject the string "abababbababbbab"', () {
      final result = dfa2.evaluateExpression('abababbababbbab');
      expect(result, true);
    });
  });
}
