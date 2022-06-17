import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {

  List<int> integers = [2, 4, 67, 5, 3, 1, 8, 9, 0, 56, 78, 43, 12];

  // The element that should be found
  int shouldBeFound = 5;

  BinarySearch search = new BinarySearch();
  int? atIndex = search.find<num>(integers, shouldBeFound);

  print("Should be found: $shouldBeFound. Found ${integers[atIndex!]} at index $atIndex.");

}

class BinarySearch implements SearchAlgorithm {
  /**
     * @param array is an array where the element should be found
     * @param key is an element which should be found
     * @param <T> is any comparable type
     * @return index of the element
     */
  @override
  int? find<T extends Comparable<T>>(List<T> array, T key) {
    return search(array, key, 0, array.length);
  }

  /**
     * This method implements the Generic Binary Search
     *
     * @param array The array to make the binary search
     * @param key The number you are looking for
     * @param left The lower bound
     * @param right The upper bound
     * @return the location of the key
     */
  int search<T extends Comparable<T>>(
      List<T> array, T key, int left, int right) {
    if (right < left) {
      return -1; // this means that the key not found
    }
    // find median
    int median = (left + right) >>> 1;
    int comp = key.compareTo(array[median]);

    if (comp == 0) {
      return median;
    } else if (comp < 0) {
      return search(array, key, left, median - 1);
    } else {
      return search(array, key, median + 1, right);
    }
  }
}
