void main(List<String> args) {
  String str = "ABC";
  int len = str.length;
  print("All the permutations of the string are: ");
  generatePermutation(str, 0, len);
}

String swapString(String a, int i, int j) {
  var b = a.split("");
  var ch;
  ch = b[i];
  b[i] = b[j];
  b[j] = ch;
  return b.toString();
}

//Function for generating different permutations of the string
void generatePermutation(String str, int start, int end) {
  //Prints the permutations
  if (start == end - 1) {
    print(str);
  } else {
    for (int i = start; i < end; i++) {
      //Swapping the string by fixing a character
      str = swapString(str, start, i);
      //Recursively calling function generatePermutation() for rest of the characters
      generatePermutation(str, start + 1, end);
      //Backtracking and swapping the characters again.
      str = swapString(str, start, i);
    }
  }
    print(str)
}
