void main(List<String> args) {
  print(isAllCharactersSame("mmmm"));
}

bool isAllCharactersSame(String s) {
  for (int i = 1, length = s.length; i < length; ++i) {
    if (s[i] != s[0]) {
      return false;
    }
  }
  return true;
}
