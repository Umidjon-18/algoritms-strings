import 'dart:math';

void main(List<String> args) {
  List<int> arr = [];
  var length = 100;
  Random random = new Random();

  // Print out unsorted elements
  for (int i = 0; i < length; ++i) {
    arr.add(random.nextInt(100) - 50);
  }
  print(arr);

  print("--------------");

  OddEvenSort().oddEvenSort(arr);

  //Print Sorted elements
  print(arr);
}

class OddEvenSort {
  /**
     * Odd Even Sort algorithms implements
     *
     * @param arr the array contains elements
     */
  void oddEvenSort(List<int> arr) {
    bool sorted = false;
    while (!sorted) {
      sorted = true;

      for (int i = 1; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          swap(arr, i, i + 1);
          sorted = false;
        }
      }

      for (int i = 0; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          swap(arr, i, i + 1);
          sorted = false;
        }
      }
    }
  }

  /**
     * Helper function to swap two array values.
     *
     * @param arr the array contains elements
     * @param i the first index to be swapped
     * @param j the second index to be swapped
     */
  swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
