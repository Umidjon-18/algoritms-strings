import 'sort_algorithm.dart';

void main(List<String> args) {
  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  SelectionSort selectionSort = new SelectionSort();
  List<num> sorted = selectionSort.sort<num>(arr);
  print(sorted);

  List<String> strings = ["c", "a", "e", "b", "d"];
  List<String> sortedStrings = selectionSort.sort(strings);
  print(sortedStrings);
}

class SelectionSort implements SortAlgorithm {
  /**
     * Generic selection sort algorithm in increasing order.
     *
     * @param arr the array to be sorted.
     * @param <T> the class of array.
     * @return sorted array.
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> arr) {
    int n = arr.length;
    for (int i = 0; i < n - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < n; j++) {
        if (arr[minIndex].compareTo(arr[j]) > 0) {
          minIndex = j;
        }
      }
      if (minIndex != i) {
        T temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
      }
    }
    return arr;
  }
}
