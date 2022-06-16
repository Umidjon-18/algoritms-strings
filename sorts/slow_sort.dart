import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  SlowSort slowSort = new SlowSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202, 98];
        // Print integerArray unsorted
        print(integerArray);

        slowSort.sort<num>(integerArray);
        // Print integerArray sorted
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        // Print stringArray unsorted
        print(stringArray);

        slowSort.sort(stringArray);
        // Print stringArray sorted
        print(stringArray);

}


 class SlowSort with SortUtils implements SortAlgorithm {

    @override
    List<T> sort<T extends Comparable<T>>(List<T> unsortedArray) {
        sort2(unsortedArray, 0, unsortedArray.length - 1);
        return unsortedArray;
    }

     void sort2<T extends Comparable<T>>(List<T> array, int i, int j) {
        if (greaterOrEqual<num>(i, j)) {
            return;
        }
        int m = (i + j) ~/ 2;
        sort2(array, i, m);
        sort2(array, m + 1, j);
        if (less(array[j], array[m])) {
            T temp = array[j];
            array[j] = array[m];
            array[m] = temp;
        }
        sort2(array, i, j - 1);
    }

}