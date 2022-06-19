void main(List<String> args) {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  print(ArrayLeftRotation().rotateLeft(arr, 3));
}

class ArrayLeftRotation {
  /*
	 * Returns the result of left rotation of given array arr and integer n
	 * 
	 * @param arr : int[] given array
	 * 
	 * @param n : int given integer
	 * 
	 * @return : int[] result of left rotation
	 */
  List<int> rotateLeft(List<int> arr, int n) {
    int size = arr.length;
    List<int> dst = [];
    n = n % size;
    for (int i = 0; i < size; i++) {
      dst[i] = arr[n];
      n = (n + 1) % size;
    }
    return dst;
  }
}
