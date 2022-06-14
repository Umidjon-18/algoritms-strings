import 'extension.dart';

void main(List<String> args) {
  print(toUpperCase("object"));
}

String toUpperCase(String s) {
  if (s == "") {
    return s;
  }
  List<String> values = s.split("");
  for (int i = 0; i < values.length; ++i) {
    if (values[i].isLetter(values[i]) && values[i].isLowerCase(values[i])) {
      values[i] = values[i].toUpperCase();
    }
  }
  return values.join();
}
