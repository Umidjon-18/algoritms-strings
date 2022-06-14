import 'dart:math';

import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  var array = List.filled(10, 0);

  Random random = new Random();
  /* generate 10 random numbers from -50 to 49 */
  for (int i = 0; i < array.length; ++i) {
    array[i] = random.nextInt(100) - 50;
  }

  BubbleSortRecursion bubbleSortRecursion = new BubbleSortRecursion();
  bubbleSortRecursion.sort<num>(array);
  print(array);
}

class BubbleSortRecursion implements SortAlgorithm {
  /**
     * @param unsorted - an array should be sorted
     * @return sorted array
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    bubbleSort(unsorted, unsorted.length);
    return unsorted;
  }

  /**
     * BubbleSort algorithm implements using recursion
     *
     * @param unsorted array contains elements
     * @param len length of given array
     */
  void bubbleSort<T extends Comparable<T>>(List<T> unsorted, int len) {
    bool swapped = false;
    /* flag to check if array is sorted or not */
    for (int i = 0; i < len - 1; ++i) {
      if (SortUtils().greater(unsorted[i], unsorted[i + 1])) {
        SortUtils().swap(unsorted, i, i + 1);
        swapped = true;
      }
    }
    if (swapped) {
      bubbleSort(unsorted, len - 1);
    }
  }
}
