import 'dart:convert';
import 'dart:io';

import '../abstractions/constants.dart';

const alphabet = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'x',
  'y',
  'z',
];

class LevenshteinAutomaton {
  generateAutomaton(String input, int distance) {
    List finalStates = [];
    List states = [];
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
                input[j]: [nextState],
                // ...generateEntriesForAlphabet(
                //   alphabet,
                //   [bottomState, diagonalState],
                //   input[j],
                //   nextState,
                // ),
                sigma: [bottomState, diagonalState],
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
                // ...generateEntriesForAlphabet(
                //   alphabet,
                //   [bottomState],
                // ),
                sigma: [bottomState],
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
    createResultJSON(transitions);
    print(states);
    print(finalStates);
  }

  Map generateEntriesForAlphabet(
    List<String> alphabet,
    List<String> states, [
    String? currentInput,
    String? nextState,
  ]) {
    Map entries = {};
    for (final element in alphabet) {
      if (currentInput != null && element == currentInput) {
        entries.addAll({
          element: states + [nextState!]
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

  automaton.generateAutomaton('word', 2);
}
