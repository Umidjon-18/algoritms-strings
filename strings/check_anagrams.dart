void main(List<String> args) {
  print(isAnagrams("aseds", "sead"));
}

bool isAnagrams(String s1, String s2) {
  int l1 = s1.length;
  int l2 = s2.length;
  s1 = s1.toLowerCase();
  s2 = s2.toLowerCase();

  var c1 = s1.split("");
  var c2 = s2.split("");
  c1.sort();
  c2.sort();

  if (l1 != l2) {
    return false;
  }
  for (var i = 0; i < l1; i++) {
    if (c1[i] != c2[i]) {
      return false;
    }
  }
  return true;
}
