import 'automaton.dart';

abstract class NonDeterministicAutomaton extends Automaton {
  final List<String> states;
  final List<String> alphabet;
  final Map<String, Map<String, List<String>>> transitions;
  final String initialState;
  final List<String> finalStates;

  const NonDeterministicAutomaton({
    required this.states,
    required this.alphabet,
    required this.transitions,
    required this.initialState,
    required this.finalStates,
  });

  List<String> extendedTransition(String state, String input);
}
