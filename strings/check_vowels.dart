void main(List<String> args) {
  // print(countVowels("auemdof"));
  var a = DateTime.now();
  print(a);
}

final Set<String> VOWELS = ['a', 'e', 'i', 'o', 'u'].toSet();

/**
     * Check if a string is has vowels or not
     *
     * @param input a string
     * @return {@code true} if given string has vowels, otherwise {@code false}
     */
bool hasVowels(String? input) {
  return countVowels(input) > 0;
}

/**
     * count the number of vowels
     *
     * @param input a string prints the count of vowels
     */
int countVowels(String? input) {
  if (input == null) {
    return 0;
  }
  int cnt = 0;
  for (String c in input.toLowerCase().split("")) {
    if (VOWELS.contains(c)) {
      ++cnt;
    }
  }
  return cnt;
}

extension Yangi on DateTime {
  static const PU = 23;
  void aaa() {
    print("aaa");
  }
}
