import '../abstractions/non_deterministic_automaton.dart';

class EpsilonNFA extends NonDeterministicAutomaton {
  EpsilonNFA({
    required super.states,
    required super.alphabet,
    required super.transitions,
    required super.initialState,
    required super.finalStates,
  });

  @override
  bool evaluate(String input) {
    final eClosure = epsilonClosure(initialState);
    final states = eClosure
        .map((cState) => extendedTransition(cState, input))
        .reduce((a, b) => a += b);
    return states.any((state) => finalStates.contains(state));
  }

  @override
  List<String> extendedTransition(String state, String input) {
    if (input.isEmpty) return [state];
    final possibleNextStates = transitions[state]![input[0]];
    if (possibleNextStates == null) return [];
    return possibleNextStates
        .map((nextState) => epsilonClosure(nextState)
            .map((cState) => extendedTransition(cState, input.substring(1)))
            .reduce((a, b) => a += b))
        .reduce((a, b) => a += b);
  }

  List<String> epsilonClosure(String state) {
    if (!transitions[state]!.containsKey(epsilon)) return [state];
    final possibleNextStates = transitions[state]![epsilon]!;
    return [state] +
        possibleNextStates
            .map((nextState) => epsilonClosure(nextState))
            .reduce((a, b) => a += b);
  }
}

const epsilon = 'ε';

void main() {
  // Σ = {a, b}, L = {w : w ends with bba}
  final nfa2 = EpsilonNFA(
    states: ['q0', 'q1' 'q2', 'q3'],
    initialState: 'q0',
    finalStates: ['q3'],
    alphabet: ['a', 'b'],
    transitions: {
      'q0': {
        'a': ['q0'],
        'b': ['q0', 'q1'],
      },
      'q1': {
        'b': ['q2'],
      },
      'q2': {
        'a': ['q3'],
      },
      'q3': {}
    },
  );

  print(nfa2.evaluate('abbba'));
}
