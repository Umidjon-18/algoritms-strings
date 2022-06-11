void main(List<String> args) {
  print(isAlphabetical("aabdefi"));
}

isAlphabetical(String s) {
  s = s.toLowerCase();
  for (int i = 0; i < s.length - 1; ++i) {
    var element = s[i].codeUnitAt(0);
    if ((element < 97 || element > 122) || element > s[i + 1].codeUnitAt(0)) {
      return false;
    }
  }
  return true;
}
