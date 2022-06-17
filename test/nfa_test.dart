import 'package:test/test.dart';
import 'package:theory_of_computation/nfa.dart';

void main() {
  final nfa1 = NFA(
    states: ['q0', 'q1', 'q2'],
    initialState: 'q0',
    finalStates: ['q2'],
    alphabet: ['0', '1'],
    transitions: {
      'q0': {
        '1': ['q1']
      },
      'q1': {
        '0': ['q2']
      },
      'q2': {
        '1': ['q2'],
        '0': ['q2']
      },
    },
  );

  group('DFA over the set {0, 1} that starts with the substring "10"', () {
    test('Should accept the string "10"', () {
      final result = nfa1.evaluate('10');
      expect(result, true);
    });
    test('Should accept the string "10100101111011111"', () {
      final result = nfa1.evaluate('10100101111011111');
      expect(result, true);
    });
    test('Should accept the string "10000"', () {
      final result = nfa1.evaluate('10000');
      expect(result, true);
    });
    test('Should accept the string "101111"', () {
      final result = nfa1.evaluate('101111');
      expect(result, true);
    });
    test('Should accept the string "1010001"', () {
      final result = nfa1.evaluate('1010001');
      expect(result, true);
    });
    test('Should reject the string "01"', () {
      final result = nfa1.evaluate('01');
      expect(result, false);
    });
    test('Should reject the string "0000"', () {
      final result = nfa1.evaluate('0000');
      expect(result, false);
    });
    test('Should reject the empty string', () {
      final result = nfa1.evaluate('');
      expect(result, false);
    });
    test('Should reject the string "01011101100"', () {
      final result = nfa1.evaluate('01011101100');
      expect(result, false);
    });
    test('Should reject the string "111101101"', () {
      final result = nfa1.evaluate('111101101');
      expect(result, false);
    });
    test('Should reject the string "1101010"', () {
      final result = nfa1.evaluate('1101010');
      expect(result, false);
    });
  });
}
