mixin InputValidator {
  bool hasValidInput(String input, List<String> alphabet) {
    final symbols = input.split('');
    return symbols.every((symbol) => alphabet.contains(symbol));
  }
}
