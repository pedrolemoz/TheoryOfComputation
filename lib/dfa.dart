class DFA {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, String>> transitions;
  final String initialState;
  final List<String> finalStates;

  const DFA({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  });

  bool evaluate(String input) {
    final state = extendedTransition(initialState, input);
    return finalStates.contains(state);
  }

  String extendedTransition(String state, String input) {
    if (input.isEmpty) return state;
    return extendedTransition(
      transitions[state]![input[0]]!,
      input.substring(1),
    );
  }
}
