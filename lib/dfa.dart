class DFA {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, String>> transitions;
  final String initialState;
  final List<String> finalStates;

  DFA({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  });

  String evaluateExpression(String expression) {
    final state = extendedTransition(initialState, expression);
    if (finalStates.contains(state)) {
      return '${expression} is Accepted';
    } else {
      return '${expression} is Rejected';
    }
  }

  String extendedTransition(String state, String symbol) {
    if (symbol.isEmpty) return state;
    return extendedTransition(
      transitions[state]![symbol[0]]!,
      symbol.substring(1),
    );
  }
}
