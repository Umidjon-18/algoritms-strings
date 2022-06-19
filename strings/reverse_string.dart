void main(List<String> args) {
  print(reverse("Umidjon"));
  print(reverse2("Umidjon"));
}

String reverse(String str) {
  return str.split("").reversed.join();
}

String reverse2(String str) {
  if (str.isEmpty) {
    return str;
  }

  var value = str.split("");
  for (int i = 0, j = str.length - 1; i < j; i++, j--) {
    String temp = value[i];
    value[i] = value[j];
    value[j] = temp;
  }
  return value.join();
}


class MyExep implements Exception {
  
}