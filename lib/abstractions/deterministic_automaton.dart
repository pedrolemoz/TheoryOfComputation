import 'automaton.dart';

abstract class DeterministicAutomaton implements Automaton {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, String>> transitions;
  final String initialState;
  final List<String> finalStates;

  const DeterministicAutomaton({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  });

  String extendedTransition(String state, String input);
}
