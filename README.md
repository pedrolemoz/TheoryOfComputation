# Data cleaning with Levenshtein's automaton

## Team:

- João Pedro Pereira Lemos (@pedrolemoz)
- Oziel Pontes da Silva Filho (@OzielFilho)

### How to run

You have two options to run this project. You can run the compiled binary or you can download the Dart SDK.

For the first option, go to the [releases page](https://github.com/pedrolemoz/TheoryOfComputation/releases) and check the avaliable binaries. Then, just run the binary through your system terminal.

If you'd like to run the code from source, install the Dart SDK avaliable in [dart.dev](https://dart.dev/get-dart).

Once the SDK is installed, run the following command inside `lib` folder:

```bash
dart data_cleaning.dart
```

## Obtained results

Once the program is executed, it will produce a `output` folder in the current directory you ran, which contains the cleaned data from the CSV files.

You'll find these two files:

- `analysed_cities.txt`, using the distance of 1
- `analysed_brands.txt`, using the distance of 2