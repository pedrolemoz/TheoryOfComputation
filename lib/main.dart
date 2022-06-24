import 'implementations/levenshtein.dart';
import 'utils/pakistan_suicide_attacks.dart';

void main() {
  const levenshteinAutomaton = LevenshteinAutomaton();

  final citiesInLowercase =
      cities.map((city) => city.toLowerCase().trim()).toSet().toList();

  Set<String> analysedCities = {};

  for (final city in citiesInLowercase) {
    analysedCities.add(
      levenshteinAutomaton
          .getAllStringsWithMaxDistance(city, 1, citiesInLowercase)
          .first,
    );
  }

  for (final city in analysedCities) {
    print(city);
  }
}
