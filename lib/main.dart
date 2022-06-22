import 'package:theory_of_computation/implementations/levenshtein.dart';
import 'package:theory_of_computation/utils/pakistan_suicide_attacks.dart';

void main() async {
  final levenshteinAutomaton = const LevenshteinAutomaton();
  var citysLowerCase = cities.map((e) => e.toLowerCase()).toList();
  var automatons = [];
  for (int i = 0; i <= citysLowerCase.length - 1; i++) {
    final automaton =
        levenshteinAutomaton.generateAutomaton(citysLowerCase[i], 1);
    automatons.add(automaton);
  }
}
