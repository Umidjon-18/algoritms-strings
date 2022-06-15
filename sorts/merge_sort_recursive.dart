void main(List<String> args) {
  MergeSortRecursive sort =
      new MergeSortRecursive([4, 3, 1, 8, 5, 10, 0, 1, 4, 11, 8, 9]);
  sort.mergeSort();
}

class MergeSortRecursive {
  late List<int> arr;

  MergeSortRecursive(List<int> arr) {
    this.arr = arr;
  }

  void mergeSort() {
    var arrSorted = merge(arr);
    print(arrSorted);
  }

  List<int> merge(List<int> arr) {
    // base condition
    if (arr.length <= 1) {
      return arr;
    }

    int arrLength = arr.length;
    int half = arrLength ~/ 2;
    List<int> arrA = arr.sublist(0, half);
    List<int> arrB = arr.sublist(half, arr.length);

    // recursion
    arrA = merge(arrA);
    arrB = merge(arrB);

    return sort(arrA, arrB);
  }

  List<int> sort(List<int> unsortedA, List<int> unsortedB) {
    if (unsortedA.length <= 0 && unsortedB.length <= 0) {
      return [];
    }
    if (unsortedA.length <= 0) {
      return unsortedB;
    }
    if (unsortedB.length <= 0) {
      return unsortedA;
    }
    if (unsortedA[0] <= unsortedB[0]) {
      List<int> newAl = [unsortedA[0]];
      newAl.addAll(sort(unsortedA.sublist(1, unsortedA.length), unsortedB));
      return newAl;
    } else {
      List<int> newAl = [unsortedB[0]];
      newAl.addAll(sort(unsortedA, unsortedB.sublist(1, unsortedB.length)));
      return newAl;
    }
  }
}
