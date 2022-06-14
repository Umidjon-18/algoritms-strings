import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  BubbleSort bubbleSort = new BubbleSort();
  bubbleSort.sort<num>(integers);

  print(integers);
  /* output: [1, 4, 6, 9, 12, 23, 54, 78, 231] */

  List<String> strings = ["c", "a", "e", "b", "d"];
  bubbleSort.sort(strings);

  print(bubbleSort.sort(strings));
  /* output: [a, b, c, d, e] */
}

class BubbleSort implements SortAlgorithm {
  SortUtils sortUtils = SortUtils();
  /**
     * Implements generic bubble sort algorithm.
     *
     * @param array the array to be sorted.
     * @param <T> the type of elements in the array.
     * @return the sorted array.
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> array) {
    for (int i = 1, size = array.length; i < size; ++i) {
      bool swapped = false;
      for (int j = 0; j < size - i; ++j) {
        if (sortUtils.greater(array[j], array[j + 1])) {
          sortUtils.swap(array, j, j + 1);
          swapped = true;
        }
      }
      if (!swapped) {
        break;
      }
    }
    return array;
  }

  /**
     * Driver Code
     */

}
