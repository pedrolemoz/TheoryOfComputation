import '../abstractions/constants.dart';
import 'episilon_nfa.dart';

class LevenshteinAutomaton {
  const LevenshteinAutomaton();

  static EpsilonNFA generateAutomaton(String input, int distance) {
    List<String> finalStates = [];
    List<String> states = [];
    Map<String, Map<String, List<String>>> transitions = {};
    final columns = input.length + 1;
    final rows = distance + 1;
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        final currentState = 'q$i$j';
        final nextState = 'q$i${j + 1}';
        final bottomState = 'q${i + 1}$j';
        final diagonalState = 'q${i + 1}${j + 1}';
        states.add(currentState);
        if (j < columns - 1) {
          if (i < rows - 1) {
            transitions.putIfAbsent(
              currentState,
              () => {
                ..._generateEntries(
                  alphabet,
                  [bottomState, diagonalState],
                  input[j],
                  nextState,
                ),
                epsilon: [diagonalState],
              },
            );
          } else {
            transitions.putIfAbsent(
              currentState,
              () => {
                input[j]: [nextState],
              },
            );
          }
        } else {
          finalStates.add(currentState);
          if (i < rows - 1) {
            transitions.putIfAbsent(
              currentState,
              () => {
                ..._generateEntries(
                  alphabet,
                  [bottomState],
                ),
              },
            );
          } else {
            transitions.putIfAbsent(
              currentState,
              () => {},
            );
          }
        }
      }
    }
    return EpsilonNFA(
      states: states,
      alphabet: alphabet,
      transitions: transitions,
      initialState: states[0],
      finalStates: finalStates,
    );
  }

  static Map<String, List<String>> _generateEntries(
    List<String> alphabet,
    List<String> states, [
    String? currentInput,
    String? nextState,
  ]) {
    Map<String, List<String>> entries = {};
    for (final element in alphabet) {
      if (currentInput != null && element == currentInput) {
        entries.addAll({
          element: [nextState!] + states
        });
      } else {
        entries.addAll({element: states});
      }
    }
    return entries;
  }

  static Set<String> getStringsWithDistance(
    String input,
    int distance,
    Iterable<String> source,
  ) {
    Set<String> matchingStrings = {};
    final inputAutomaton = generateAutomaton(input, distance);
    for (final string in source) {
      if (inputAutomaton.evaluate(string)) {
        matchingStrings.add(string);
      }
    }
    return matchingStrings;
  }

  static Set<String> removeInconsistencies({
    required List<String> source,
    required int distance,
  }) {
    Set<String> analysedSource = {};
    final sourceInLowerCase =
        source.map((word) => word.toLowerCase().trim()).toSet();
    for (final word in sourceInLowerCase) {
      final result = getStringsWithDistance(
        word,
        distance,
        sourceInLowerCase,
      );
      if (result.isNotEmpty) analysedSource.add(result.first);
    }
    return analysedSource;
  }
}
