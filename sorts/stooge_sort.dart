import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  StoogeSort stoogeSort = new StoogeSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202];
        // Print integerArray unsorted
        print(integerArray);

        stoogeSort.sort<num>(integerArray);
        // Print integerArray sorted
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        // Print stringArray unsorted
        print(stringArray);

        stoogeSort.sort(stringArray);
        // Print stringArray sorted
        print(stringArray);
}


 class StoogeSort with SortUtils implements SortAlgorithm {

    @override
     List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        sort2(unsortedArray, 0, unsortedArray.length);
        return unsortedArray;
    }

     List<T> sort2<T extends Comparable<T>>(List<T> unsortedArray, int start, int end) {
        if (less(unsortedArray[end - 1], unsortedArray[start])) {
            T temp = unsortedArray[start];
            unsortedArray[start] = unsortedArray[end - 1];
            unsortedArray[end - 1] = temp;
        }

        int len = end - start;
        if (len > 2) {
            int third = len ~/ 3;
            sort2(unsortedArray, start, end - third);
            sort2(unsortedArray, start + third, end);
            sort2(unsortedArray, start, end - third);
        }
        return unsortedArray;
    }


}