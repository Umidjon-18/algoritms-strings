import 'sort_algorithm.dart';
import 'sort_utils.dart';
void main(List<String> args) {
  
}

class DutchNationalFlagSort implements SortAlgorithm {

    @override
     List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
        return dutch_national_flag_sort(unsorted, unsorted[((unsorted.length)/2.0).ceil() - 1]);
    }

    List<T> sorts<T extends Comparable<T>>(List<T> unsorted, T intendedMiddle) {
        return dutch_national_flag_sort(unsorted, intendedMiddle);
    }

    List<T> dutch_national_flag_sort<T extends Comparable<T>> (List<T> arr, T intendedMiddle){
        int i = 0;
        int j = 0;
        int k = arr.length - 1;

        while( j <= k){
            if ( 0 > arr[j].compareTo(intendedMiddle)){
                SortUtils().swap(arr, i, j);
                j++;
                i++;
            } else if (0 < arr[j].compareTo(intendedMiddle)){
                SortUtils().swap(arr, j, k);
                k--;
            } else {
                j++;
            }
        }
       return arr;
    }
}