class DFA {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, String>> transitions;
  final String initialState;
  final List<String> finalStates;
  late String currentState;

  DFA({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  }) {
    currentState = initialState;
  }

  String evaluateExpression(String expression) {
    final symbols = expression.split('');

    for (var symbol in symbols) {
      currentState = transitions[currentState]![symbol]!;
    }

    if (finalStates.contains(currentState)) {
      return '${expression} is Accepted';
    } else {
      return '${expression} is Rejected';
    }
  }
}

void main() {
  final dfa = DFA(
    states: ['q0', 'q1', 'q2'],
    initialState: 'q0',
    finalStates: ['q0'],
    alphabet: ['0', '1', '2'],
    transitions: {
      'q0': {'0': 'q0', '1': 'q1', '2': 'q2'},
      'q1': {'0': 'q1', '1': 'q2', '2': 'q0'},
      'q2': {'0': 'q2', '1': 'q0', '2': 'q1'},
    },
  );

  print(dfa.evaluateExpression('011'));
  print(dfa.evaluateExpression('1212'));
  print(dfa.evaluateExpression('222'));
  print(dfa.evaluateExpression('022'));
}
