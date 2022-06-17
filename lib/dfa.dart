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

  bool evaluateExpression(String symbol) {
    final state = extendedTransition(initialState, symbol);
    return finalStates.contains(state);
  }

  String extendedTransition(String state, String symbol) {
    if (symbol.isEmpty) return state;
    return extendedTransition(
      transitions[state]![symbol[0]]!,
      symbol.substring(1),
    );
  }
}
