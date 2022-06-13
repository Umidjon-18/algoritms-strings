import 'extension.dart';

void main(List<String> args) {
  print(toLowerCase("AqweTRs"));
}

/**
     * Converts all of the characters in this {@code String} to lower case
     *
     * @param s the string to convert
     * @return the {@code String}, converted to lowercase.
     */
String toLowerCase(String s) {
  var values = s.split("");
  for (int i = 0; i < values.length; ++i) {
    if (values[i].isLetter(values[i]) && values[i].isUpperCase(values[i])) {
      values[i] = values[i].toLowerCase();
    }
  }
  return values.join();
}
