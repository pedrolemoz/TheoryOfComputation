import 'implementations/levenshtein.dart';
import 'utils/file_utils.dart';
import 'utils/pakistan_suicide_attacks.dart';
import 'utils/ramen_ratings.dart';

Future<void> main() async {
  print('Analysing cities...');
  final analysedCities = LevenshteinAutomaton.removeInconsistencies(
    source: cities,
    distance: 1,
  );
  print('Analysing brands...');
  final analysedBrands = LevenshteinAutomaton.removeInconsistencies(
    source: brands,
    distance: 2,
  );

  await FileUtils.createOutputFile(
    fileName: 'analysed_cities.txt',
    contents: analysedCities,
  );
  await FileUtils.createOutputFile(
    fileName: 'analysed_brands.txt',
    contents: analysedBrands,
  );
}
