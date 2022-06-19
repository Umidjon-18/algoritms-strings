import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {
  Random r = new Random();
        List<int> integers = [1,2,3,4,5,5,7,6,56,56,45,4,34,2342,34,2432,23,23,23,23,23,23,57];

        // the element that should be found
        int searchIndex = r.nextInt(integers.length - 1);
        int shouldBeFound = integers[searchIndex];

        TernarySearch search = new TernarySearch();
        int atIndex = search.find<num>(integers, shouldBeFound);

        print("Should be found: $shouldBeFound. Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    
}

class TernarySearch implements SearchAlgorithm {

    /**
     * @param arr The **Sorted** array in which we will search the element.
     * @param value The value that we want to search for.
     * @return The index of the element if found. Else returns -1.
     */
    @override
    int find<T extends Comparable<T>>(List<T> arr, T value) {
        return ternarySearch(arr, value, 0, arr.length - 1);
    }

    /**
     * @param arr The **Sorted** array in which we will search the element.
     * @param key The value that we want to search for.
     * @param start The starting index from which we will start Searching.
     * @param end The ending index till which we will Search.
     * @return Returns the index of the Element if found. Else returns -1.
     */
    int ternarySearch<T extends Comparable<T>>(List<T> arr, T key, int start, int end) {
        if (start > end) {
            return -1;
        }
        /* First boundary: add 1/3 of length to start */
        int mid1 = start + (end - start) ~/ 3;
        /* Second boundary: add 2/3 of length to start */
        int mid2 = start + 2 * (end - start) ~/ 3;

        if (key.compareTo(arr[mid1]) == 0) {
            return mid1;
        } else if (key.compareTo(arr[mid2]) == 0) {
            return mid2;
        } /* Search the first (1/3) rd part of the array.*/ else if (key.compareTo(arr[mid1]) < 0) {
            return ternarySearch(arr, key, start, --mid1);
        } /* Search 3rd (1/3)rd part of the array */ else if (key.compareTo(arr[mid2]) > 0) {
            return ternarySearch(arr, key, ++mid2, end);
        } /* Search middle (1/3)rd part of the array */ else {
            return ternarySearch(arr, key, mid1, mid2);
        }
    }

}