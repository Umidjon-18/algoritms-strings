import 'dart:math';

import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
   // For integer input
        List<int> array = [3, 4, 1, 32, 0, 1, 5, 12, 2, 5, 7, 8, 9, 2, 44, 111, 5];

        QuickSort quickSort = new QuickSort();
        quickSort.sort<num>(array);

        // Output => 0 1 1 2 2 3 4 5 5 5 7 8 9 12 32 44 111
        print(array);

        List<String> stringArray = ["c", "a", "e", "b", "d"];
        quickSort.sort(stringArray);

        // Output => a	b	c	d	e
        print(stringArray);

}


class QuickSort with SortUtils implements SortAlgorithm {

  Random random = Random.secure();
    /**
     * This method implements the Generic Quick Sort
     *
     * @param array The array to be sorted Sorts the array in increasing order
     */
    @override
    List<T> sort<T extends Comparable<T>>(List<T> array) {
        doSort(array, 0, array.length - 1);
        return array;
    }

    /**
     * The sorting process
     *
     * @param left The first index of an array
     * @param right The last index of an array
     * @param array The array to be sorted
     */
    void doSort<T extends Comparable<T>>(List<T> array, int left, int right) {
        if (left < right) {
            int pivot = randomPartition(array, left, right);
            doSort(array, left, pivot - 1);
            doSort(array, pivot, right);
        }
    }

    /**
     * Ramdomize the array to avoid the basically ordered sequences
     *
     * @param array The array to be sorted
     * @param left The first index of an array
     * @param right The last index of an array
     * @return the partition index of the array
     */
    int  randomPartition<T extends Comparable<T>>(List<T> array, int left, int right) {
        int randomIndex = left +random.nextInt(1) * (right - left + 1);
        swap(array, randomIndex, right);
        return partition(array, left, right);
    }

    /**
     * This method finds the partition index for an array
     *
     * @param array The array to be sorted
     * @param left The first index of an array
     * @param right The last index of an array Finds the partition index of an
     * array
     */
    int  partition<T extends Comparable<T>>(List<T> array, int left, int right) {
        int mid = (left + right) >>> 1;
        T pivot = array[mid];

        while (left <= right) {
            while (less(array[left], pivot)) {
                ++left;
            }
            while (less(pivot, array[right])) {
                --right;
            }
            if (left <= right) {
                swap(array, left, right);
                ++left;
                --right;
            }
        }
        return left;
    }

  
}