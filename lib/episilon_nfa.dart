class EpsilonNFA {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, List<String>>> transitions;
  final String initialState;
  final List<String> finalStates;

  const EpsilonNFA({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  });

  bool evaluate(String input) {
    final eClosure = epsilonClosure(initialState);
    final states = eClosure
        .map((cState) => extendedTransition(cState, input))
        .reduce((a, b) => a += b);
    return states.any((state) => finalStates.contains(state));
  }

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
  // { a^n | n is even or divisible by 3 }
  final nfa = EpsilonNFA(
    states: ['p', 'q' 'r', 'q1', 'r1', 'r2'],
    initialState: 'p',
    finalStates: ['q', 'r'],
    alphabet: ['a'],
    transitions: {
      'p': {
        epsilon: ['q', 'r']
      },
      'q': {
        'a': ['q1']
      },
      'r': {
        'a': ['r1'],
      },
      'q1': {
        'a': ['q'],
      },
      'r1': {
        'a': ['r2'],
      },
      'r2': {
        'a': ['r'],
      },
    },
  );

  print(nfa.evaluate(epsilon));
  print(nfa.evaluate('a'));
  print(nfa.evaluate('aa'));
  print(nfa.evaluate('aaa'));
  print(nfa.evaluate('aaaaaa'));
  print(nfa.evaluate('aaaaa'));
  print(nfa.evaluate('aaaaaaa'));
  print(nfa.evaluate('aaaaaaaa'));
  print(nfa.evaluate('aaaaaaaaa'));
  print(nfa.evaluate('aaaaaaaaaa'));
  print(nfa.evaluate('aaaaaaaaaaa'));
}
