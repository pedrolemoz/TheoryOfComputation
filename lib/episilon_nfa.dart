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

  bool evaluate(String symbol) {
    final states = extendedTransition(initialState, symbol);
    return states.any((state) => finalStates.contains(state));
  }

  List<String> extendedTransition(String state, String symbol) {
    if (symbol.isEmpty) return [state];
    final possibleNextStates = transitions[state]![symbol[0]];
    if (possibleNextStates == null) return [];
    return possibleNextStates
        .map((nextState) => extendedTransition(nextState, symbol.substring(1)))
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
  final nfa = EpsilonNFA(
    states: ['p', 'q', 'r'],
    initialState: 'p',
    finalStates: ['r'],
    alphabet: ['a', 'b', 'c'],
    transitions: {
      'p': {
        'b': ['q'],
        'c': ['r'],
        epsilon: ['r', 'q']
      },
      'q': {
        'a': ['p'],
        'b': ['r'],
        'c': ['p', 'q']
      },
      'r': {}
    },
  );

  final r = nfa.epsilonClosure('p');

  print(r);
}
