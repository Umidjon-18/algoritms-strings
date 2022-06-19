import 'dart:io';
import 'dart:math';

import '../sorts/sort_utils.dart';

void main(List<String> args) {
  
}

class QuickSelect with SortUtils {

    /**
     * Selects the {@code n}-th largest element of {@code list}, i.e. the element that would
     * be at index n if the list was sorted.
     * <p>
     * Calling this function might change the order of elements in {@code list}.
     *
     * @param list the list of elements
     * @param n    the index
     * @param <T>  the type of list elements
     * @return the n-th largest element in the list
     * @throws IndexOutOfBoundsException if n is less than 0 or greater or equal to
     *                                   the number of elements in the list
     * @throws IllegalArgumentException  if the list is empty
     * @throws NullPointerException      if {@code list} is null
     */
    T select<T extends Comparable<T>>(List<T> list, int n) {
        

        if (list.length == 0) {
            String msg = "The list of elements must not be empty.";
            print(msg);
            exit(0);
        }

        if (n < 0) {
            String msg = "The index must not be negative.";
            print(msg);
            exit(0);
        }

        if (n >= list.length) {
            String msg = "The index must be less than the number of elements.";
            print(msg);
            exit(0);
        }

        int index = selectIndex(list, n);
        return list[index];
    }

    int selectIndex<T extends Comparable<T>>(List<T> list, int n) {
        return selectIndex2(list, 0, list.length - 1, n);
    }

    int selectIndex2<T extends Comparable<T>>(
            List<T> list,
            int left,
            int right,
            int n
    ) {
        while (true) {
            if (left == right)
                return left;
            int pivotIndex = pivot(list, left, right);
            pivotIndex = partition(list, left, right, pivotIndex, n);
            if (n == pivotIndex) {
                return n;
            } else if (n < pivotIndex) {
                right = pivotIndex - 1;
            } else {
                left = pivotIndex + 1;
            }
        }
    }

    int partition<T extends Comparable<T>>(
            List<T> list,
            int left,
            int right,
            int pivotIndex,
            int n
    ) {
        T pivotValue = list[pivotIndex];
        swap(list, pivotIndex, right);
        int storeIndex = left;

        for (int i = left; i < right; i++) {
            if (list[i].compareTo(pivotValue) < 0) {
                swap(list, storeIndex, i);
                storeIndex++;
            }
        }

        int storeIndexEq = storeIndex;

        for (int i = storeIndex; i < right; i++) {
            if (list[i].compareTo(pivotValue) == 0) {
                swap(list, storeIndexEq, i);
                storeIndexEq++;
            }
        }

        swap(list, right, storeIndexEq);

        return (n < storeIndex)
                ? storeIndex
                : min(n, storeIndexEq);
    }

     int pivot<T extends Comparable<T>>(
            List<T> list,
            int left,
            int right
    ) {
        if (right - left < 5) {
            return partition5(list, left, right);
        }

        for (int i = left; i < right; i += 5) {
            int subRight = i + 4;
            if (subRight > right) {
                subRight = right;
            }
            int median5 = partition5(list, i, subRight);
            int rightIndex = left + (i - left) ~/ 5;
            swap(list, median5, rightIndex);
        }

        int mid = (right - left) ~/ 10 + left + 1;
        int rightIndex = left + (right - left) ~/ 5;
        return selectIndex2(list, left, rightIndex, mid);
    }

   int partition5<T extends Comparable<T>>(
            List<T> list,
            int left,
            int right
    ) {
        return (left + right) >>> 1;
    }
}