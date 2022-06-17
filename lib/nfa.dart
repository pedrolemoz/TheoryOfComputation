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
    if (possibleNextStates == null) return [];
    return possibleNextStates
        .map((nextState) => extendedTransition(nextState, symbol.substring(1)))
        .reduce((a, b) => a += b);
  }
}
