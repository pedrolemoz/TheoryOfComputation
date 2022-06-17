class NFA {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, List<String>>> transitions;
  final String initialState;
  final List<String> finalStates;

  const NFA({
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
    if (possibleNextStates == null || possibleNextStates.isEmpty) return [];
    List<List<String>> states = [];
    for (var s in possibleNextStates) {
      states.add(extendedTransition(s, symbol.substring(1)));
    }
    return states.map((e) => e[0]).toList();
  }
}

void main() {
  final nfa = NFA(
    states: ['q0', 'q1', 'q2', 'q3', 'q4'],
    initialState: 'q0',
    finalStates: ['q4'],
    alphabet: ['a', 'b'],
    transitions: {
      'q0': {
        'a': ['q1'],
        'b': ['q0']
      },
      'q1': {
        'a': ['q2'],
        'b': ['q0']
      },
      'q2': {
        'a': ['q2'],
        'b': ['q3']
      },
      'q3': {
        'a': ['q1'],
        'b': ['q4']
      },
      'q4': {
        'a': ['q4'],
        'b': ['q4']
      },
    },
  );

  print(nfa.evaluate('aabb'));
}
