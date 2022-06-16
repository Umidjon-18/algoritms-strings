

import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  
}


class WiggleSort with SortUtils implements SortAlgorithm {
    @override
    List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
        return wiggleSort(unsorted);
    }

   int mapIndex(int index, int n) {
        return ((2 * index + 1) % (n | 1));
    }

    /**
     * Modified Dutch National Flag Sort. See also: sorts/DutchNationalFlagSort
     *
     * @param sortThis array to sort into group "greater", "equal" and "smaller" than median
     * @param median   defines the groups
     * @param <T>      extends interface Comparable
     */
      void triColorSort<T extends Comparable<T>>(List<T> sortThis, T median) {
        int n = sortThis.length;
        int i = 0;
        int j = 0;
        int k = n - 1;
        while (j <= k) {
            if (0 < sortThis[mapIndex(j, n)].compareTo(median)) {
                swap(sortThis, mapIndex(j, n), mapIndex(i, n));
                i++;
                j++;
            } else if (0 > sortThis[mapIndex(j, n)].compareTo(median)) {
                swap(sortThis, mapIndex(j, n), mapIndex(k, n));
                k--;
            } else {
                j++;
            }
        }
    }

     List<T> wiggleSort<T extends Comparable<T>>(List<T> sortThis) {
        // find the median using quickSelect (if the result isn't in the array, use the next greater value)
        T median;

        median = select(Arrays.<T>asList(sortThis), (int) floor(sortThis.length / 2.0));

        int numMedians = 0;

        for (T sortThi : sortThis) {
            if (0 == sortThi.compareTo(median)) {
                numMedians++;
            }
        }
        // added condition preventing off-by-one errors for odd arrays.
        // https://cs.stackexchange.com/questions/150886/how-to-find-wiggle-sortable-arrays-did-i-misunderstand-john-l-s-answer?noredirect=1&lq=1
        if (sortThis.length % 2 == 1 && numMedians == ceil(sortThis.length / 2.0)) {
            T smallestValue = select(Arrays.asList(sortThis), 0);
            if (!(0 == smallestValue.compareTo(median))) {
                throw new IllegalArgumentException("For odd Arrays if the median appears ceil(n/2) times, " +
                        "the median has to be the smallest values in the array.");
            }
        }
        if (numMedians > ceil(sortThis.length / 2.0)) {
            throw new IllegalArgumentException("No more than half the number of values may be the same.");

        }

        triColorSort(sortThis, median);
        return sortThis;
    }
}