String removeSpacesAndNewlines(String input) {
  return input.replaceAll(' ', '').replaceAll('\n', '').replaceAll('\r', '');
}