void main(List<String> args) {
  PigeonholeSort pigeonholeSort = new PigeonholeSort();
        List<int> arr = [ 8, 3, 2, 7, 4, 6, 8 ];

        print("Unsorted order is : ");
        print(arr);

        pigeonholeSort.sort(arr);
        
        print("Sorted order is : ");
        
        print(arr);
}

class PigeonholeSort {
    /*
        This code implements the pigeonhole sort algorithm for the integer array,
        but we can also implement this for string arrays too.
        See https://www.geeksforgeeks.org/pigeonhole-sort/
    */
    void sort(List<int> array){
        int maxElement = array[0];
        for (int element in array) {
            if (element > maxElement) maxElement = element;
        }

        int numOfPigeonholes = 1 + maxElement;
        List<List<int>> pigeonHole =  [];

        for (int k=0; k<numOfPigeonholes; k++) {
            pigeonHole[k] = [];
        }

        for (int t in array) {
            pigeonHole[t].add(t);
        }

        int k=0;
        for (List<int> ph in pigeonHole) {
            for (int elements in ph) {
                array[k]=elements;
                k=k+1;
            }
        }
    }

}