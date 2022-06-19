import 'dart:math';

import 'search_algorithm.dart';

void main(List<String> args) {
  JumpSearch jumpSearch = new JumpSearch();
        List<int> array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        for (int i = 0; i < array.length; i++) {
            print(jumpSearch.find<num>(array, i) == i);
        }
        print(jumpSearch.find<num>(array, -1) == -1);
        print(jumpSearch.find<num>(array, 11) == -1);
        
}

 class JumpSearch implements SearchAlgorithm {

   
    /**
     * Jump Search algorithm implements
     *
     * @param array the array contains elements
     * @param key to be searched
     * @return index of {@code key} if found, otherwise <tt>-1</tt>
     */
    @override
     int find<T extends Comparable<T>>(List<T> array, T key) {
        int length = array.length;
        /* length of array */
        int blockSize =  sqrt(length).toInt();
        /* block size to be jumped */

        int limit = blockSize;
        while (key.compareTo(array[limit]) > 0 && limit < array.length - 1) {
            limit = min(limit + blockSize, array.length - 1);
        }

        for (int i = limit - blockSize; i <= limit; i++) {
            if (array[i] == key) {
                /* execute linear search */
                return i;
            }
        }
        return -1;
        /* not found */
    }
}