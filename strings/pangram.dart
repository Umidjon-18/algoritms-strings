import 'extension.dart';

void main(List<String> args) {
  print(isPangram("The quick brown fox jumps over the azy dog"));
}

bool isPangram(String s) {
  Set<String> source = s.split("").toSet();
  int count = 0;
  for (var item in source) {
    if (item.isLetter(item)) {
      count++;
    }
  }
  if (count == 26) {
    return true;
  }
  return false;
}
