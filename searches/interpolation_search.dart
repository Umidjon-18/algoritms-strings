import 'dart:math';

void main(List<String> args) {
  Random r = new Random();
        List<int> integers = [1,2,3,4,5,5,7,6,56,56,45,4,34,2342,34,2432,23,23,23,23,23,23,57];

        // the element that should be found
        int searchIndex = r.nextInt(integers.length - 1);
        int shouldBeFound = integers[searchIndex];

        InterpolationSearch search = new InterpolationSearch();
        int atIndex = search.find(integers, shouldBeFound);

        print("Should be found: $shouldBeFound. Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    
}

class InterpolationSearch {

    /**
     * @param array is a sorted array
     * @param key is a value what shoulb be found in the array
     * @return an index if the array contains the key unless -1
     */
    int find(List<int> array, int key) {
        // Find indexes of two corners
        int start = 0, end = (array.length - 1);

        // Since array is sorted, an element present
        // in array must be in range defined by corner
        while (start <= end && key >= array[start] && key <= array[end]) {
            // Probing the position with keeping
            // uniform distribution in mind.
            int pos = start + (((end - start) ~/ (array[end] - array[start])) * (key - array[start]));

            // Condition of target found
            if (array[pos] == key) {
                return pos;
            }

            // If key is larger, key is in upper part
            if (array[pos] < key) {
                start = pos + 1;
            } // If key is smaller, x is in lower part
            else {
                end = pos - 1;
            }
        }
        return -1;
    }

}