import 'abstractions/constants.dart';
import 'utils/pakistan_suicide_attacks.dart';
import 'utils/ramen_ratings.dart';

void main() {
  _execute(base: cities, distance: 1);
  _execute(base: brand, distance: 2);
}

List<String> _execute({required List<String> base, required int distance}) {
  Set<String> analysedBase = {};

  List<String> baseLoweCase =
      base.map((word) => word.toLowerCase().trim()).toSet().toList();

  for (String word in baseLoweCase) {
    Set<String> wordResult = levenshteinAutomaton.getAllStringsWithMaxDistance(
        word, distance, baseLoweCase);

    if (wordResult.isNotEmpty) {
      analysedBase.add(
        wordResult.first,
      );
    }
  }

  return baseLoweCase;
}
