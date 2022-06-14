void main(List<String> args) {
  print(rotation("qwerty", 3));
}

String rotation(String s, int n) {
  return s.substring(n) + s.substring(0, n);
}

/**
     * Move {@code n} characters in front of given character array to the end of
     * array time complexity: O(n) space complexity: O(1)
     *
     * @param values given character array
     * @param n the total characters to be moved
     */
void rotation2(List<String> values, int n) {
  reverse(values, 0, n - 1);
  reverse(values, n, values.length - 1);
  reverse(values, 0, values.length - 1);
}

/**
     * Reverse character array
     *
     * @param values character array
     * @param from begin index of given array
     * @param to end index of given array
     */
void reverse(List<String> values, int from, int to) {
  while (from < to) {
    String temp = values[from];
    values[from] = values[to];
    values[to] = temp;
    from++;
    to--;
  }
}
