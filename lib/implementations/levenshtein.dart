import 'dart:convert';
import 'dart:io';

import '../abstractions/constants.dart';
import 'episilon_nfa.dart';

class LevenshteinAutomaton {
  EpsilonNFA generateAutomaton(String input, int distance) {
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
                ...generateEntries(
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
                ...generateEntries(
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

  Map<String, List<String>> generateEntries(
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
}

void createResultJSON(Map<String, Map<String, List<String>>> transitions) {
  final string = json.encode(transitions);
  final file = File('./result.json');
  file.writeAsStringSync(string);
}

void main() {
  final automaton = LevenshteinAutomaton();
  final eNfa = automaton.generateAutomaton('word', 2);
  print(eNfa.evaluate('word'));
  print(eNfa.evaluate('wod'));
  print(eNfa.evaluate('wood'));
  print(eNfa.evaluate('world'));
  print(eNfa.evaluate('wsedw'));
}