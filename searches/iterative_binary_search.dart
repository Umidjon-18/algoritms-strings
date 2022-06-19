import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {
  Random r =  Random.secure();
        List<int> integers = [1,2,3,4,5,5,7,6,56,56,45,4,34,2342,34,2432,23,23,23,23,23,23,57];

        // the element that should be found
        int searchIndex = r.nextInt(integers.length - 1);
        int shouldBeFound = integers[searchIndex];

        IterativeBinarySearch search = new IterativeBinarySearch();
        int atIndex = search.find<num>(integers, shouldBeFound);

        print("Should be found: $shouldBeFound. Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    
}

class IterativeBinarySearch implements SearchAlgorithm {

    /**
     * This method implements an iterative version of binary search algorithm
     *
     * @param array a sorted array
     * @param key the key to search in array
     * @return the index of key in the array or -1 if not found
     */
    @override
      int find<T extends Comparable<T>>(List<T> array, T key) {
        int l, r, k, cmp;

        l = 0;
        r = array.length - 1;

        while (l <= r) {
            k = (l + r) >>> 1;
            cmp = key.compareTo(array[k]);

            if (cmp == 0) {
                return k;
            } else if (cmp < 0) {
                r = --k;
            } else {
                l = ++k;
            }
        }

        return -1;
    }

   
}