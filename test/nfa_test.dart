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

  final nfa2 = NFA(
    states: ['q0', 'q1', 'q2'],
    initialState: 'q0',
    finalStates: ['q2'],
    alphabet: ['0', '1'],
    transitions: {
      'q0': {
        '0': ['q0'],
        '1': ['q0', 'q1']
      },
      'q1': {
        '1': ['q2']
      },
      'q2': {},
    },
  );

  group('NFA over the set {0, 1} that starts with the substring "10"', () {
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

  group('NFA over the set {0, 1} that ends with the substring "11"', () {
    test('Should accept the string "11"', () {
      final result = nfa2.evaluate('11');
      expect(result, true);
    });
    test('Should accept the string "1011"', () {
      final result = nfa2.evaluate('1011');
      expect(result, true);
    });
    test('Should accept the string "1100111011"', () {
      final result = nfa2.evaluate('1100111011');
      expect(result, true);
    });
    test('Should accept the string "0000011"', () {
      final result = nfa2.evaluate('0000011');
      expect(result, true);
    });
    test('Should accept the string "11011011011"', () {
      final result = nfa2.evaluate('11011011011');
      expect(result, true);
    });
    test('Should accept the string "1011101110111"', () {
      final result = nfa2.evaluate('1011101110111');
      expect(result, true);
    });
    test('Should accept the string "1111111"', () {
      final result = nfa2.evaluate('1111111');
      expect(result, true);
    });
    test('Should accept the string "00011000111"', () {
      final result = nfa2.evaluate('00011000111');
      expect(result, true);
    });
    test('Should accept the string "1011011101101011"', () {
      final result = nfa2.evaluate('1011011101101011');
      expect(result, true);
    });
    test('Should reject the empty string', () {
      final result = nfa2.evaluate('');
      expect(result, false);
    });
    test('Should reject the string "0"', () {
      final result = nfa2.evaluate('0');
      expect(result, false);
    });
    test('Should reject the string "1"', () {
      final result = nfa2.evaluate('1');
      expect(result, false);
    });
    test('Should reject the string "10"', () {
      final result = nfa2.evaluate('10');
      expect(result, false);
    });
    test('Should reject the string "01"', () {
      final result = nfa2.evaluate('01');
      expect(result, false);
    });
    test('Should reject the string "1001010"', () {
      final result = nfa2.evaluate('1001010');
      expect(result, false);
    });
    test('Should reject the string "1110110"', () {
      final result = nfa2.evaluate('1110110');
      expect(result, false);
    });
    test('Should reject the string "000110001"', () {
      final result = nfa2.evaluate('000110001');
      expect(result, false);
    });
    test('Should reject the string "0001100010"', () {
      final result = nfa2.evaluate('0001100010');
      expect(result, false);
    });
    test('Should reject the string "0000000"', () {
      final result = nfa2.evaluate('0000000');
      expect(result, false);
    });
    test('Should reject the string "101010101001"', () {
      final result = nfa2.evaluate('101010101001');
      expect(result, false);
    });
    test('Should reject the string "1010110"', () {
      final result = nfa2.evaluate('1010110');
      expect(result, false);
    });
    test('Should reject the string "1110"', () {
      final result = nfa2.evaluate('1110');
      expect(result, false);
    });
  });
}
