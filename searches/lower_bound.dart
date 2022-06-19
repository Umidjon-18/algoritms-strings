import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {
   // just generate data
       Random r =  Random.secure();
        List<int> integers = [1,2,3,4,5,5,7,6,56,56,45,4,34,2342,34,2432,23,23,23,23,23,23,57];

        // the element that should be found
        int searchIndex = r.nextInt(integers.length - 1);
        int shouldBeFound = integers[searchIndex];

        LowerBound search = new LowerBound();
        int atIndex = search.find<num>(integers, shouldBeFound);

        print("Should be found: $shouldBeFound. Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    
}

class LowerBound implements SearchAlgorithm {

    /**
     * @param array is an array where the LowerBound value is to be found
     * @param key is an element for which the LowerBound is to be found
     * @param <T> is any comparable type
     * @return index of the LowerBound element
     */
    @override
     int find<T extends Comparable<T>>(List<T> array, T key) {
        return search(array, key, 0, array.length - 1);
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
     int search<T extends Comparable<T>>(List<T> array, T key, int left, int right) {
        if (right <= left) {
            return left;
        }

        // find median
        int median = (left + right) >>> 1;
        int comp = key.compareTo(array[median]);

        if (comp == 0) {
            return median;
        } else if (comp < 0) {
            // median position can be a possible solution
            return search(array, key, left, median);
        } else {
            // key we are looking is greater, so we must look on the right of median position
            return search(array, key, median + 1, right);
        }
    }
}