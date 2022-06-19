class SortUtils {
  /**
     * Helper method for swapping places in array
     *
     * @param array The array which elements we want to swap
     * @param idx index of the first element
     * @param idy index of the second element
     */
  bool swap<T>(List<T> array, int idx, int idy) {
    T swap = array[idx];
    array[idx] = array[idy];
    array[idy] = swap;
    return true;
  }

  /**
     * This method checks if first element is less than the other element
     *
     * @param v first element
     * @param w second element
     * @return true if the first element is less than the second element
     */
  bool less<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) < 0;
  }

  /**
     * This method checks if first element is greater than the other element
     *
     * @param v first element
     * @param w second element
     * @return true if the first element is greater than the second element
     */
  bool greater<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) > 0;
  }

  /**
     * This method checks if first element is greater than or equal the other
     * element
     *
     * @param v first element
     * @param w second element
     * @return true if the first element is greater than or equal the second
     * element
     */
  bool greaterOrEqual<T extends Comparable<T>>(T v, T w) {
    return v.compareTo(w) >= 0;
  }

  /**
     * Prints a list
     *
     * @param toPrint - a list which should be printed
     */
  //  void print(List<?> toPrint) {
  //     toPrint.stream().map(Object::toString).map(str -> str + " ").forEach(System.out::print);

  //     System.out.println();
  // }

  /**
     * Prints an array
     *
     * @param toPrint - an array which should be printed
     */
  static void print(Object toPrint) {
    print(toPrint.toString());
  }

  /**
     * Swaps all position from {
     *
     * @param left} to @{
     * @param right} for {
     * @param array}
     *
     * @param array is an array
     * @param left is a left flip border of the array
     * @param right is a right flip border of the array
     */
  flip<T extends Comparable<T>>(List<T> array, int left, int right) {
    while (left <= right) {
      swap(array, left++, right--);
    }
  }

  select<T extends Comparable<T>>(List<T> array, int point) {
    for (var item in array) {
      if (item == point) {
        return item;
      }
    }
    return null;
  }

  void arrayCopy<T extends Comparable<T>>(
      List<T> array1, int index, List<T> array2, int destIndex, int length) {
    var section = array1.sublist(index, index + length);
    for (var i = 0; i < section.length; i++) {
      array2[destIndex + i] = section[i];
    }
  }
}
