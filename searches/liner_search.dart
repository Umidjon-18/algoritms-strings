import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {
   // just generate data
       Random r =  Random.secure();
        List<int> integers = [1,2,3,4,5,5,7,6,56,56,45,4,34,2342,34,2432,23,23,23,23,23,23,57];

        // the element that should be found
        int searchIndex = r.nextInt(integers.length - 1);
        int shouldBeFound = integers[searchIndex];

        LinearSearch search = new LinearSearch();
        int atIndex = search.find<num>(integers, shouldBeFound);

        print("Should be found: $shouldBeFound. Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    
}

class LinearSearch implements SearchAlgorithm {

    /**
     * Generic Linear search method
     *
     * @param array List to be searched
     * @param value Key being searched for
     * @return Location of the key
     */
    @override
    int find<T extends Comparable<T>>(List<T> array, T value) {
        for (int i = 0; i < array.length; i++) {
            if (array[i].compareTo(value) == 0) {
                return i;
            }
        }
        return -1;
    }
}