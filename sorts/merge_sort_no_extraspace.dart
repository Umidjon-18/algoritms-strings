import 'dart:io';

void main(List<String> args) {
  print("Enter array size");
  int n = int.parse(stdin.readLineSync()!);
  List<int> a = [];
  print("Enter array elements");
  for (int i = 0; i < n; i++) {
    a.add(int.parse(stdin.readLineSync()!));
  }
  MergeSortNoExtraSpace().call_merge_sort(a, n);
  for (int i = 0; i < a.length; i++) {
    print(a[i]);
  }
}

class MergeSortNoExtraSpace {
  void call_merge_sort(List<int> a, int n) {
    // int maxele = int.parse(Stream.fromIterable(a)
    //         .reduce((value, element) => value < element ? value : element)
    //         .toString()) +
    //     1;
    merge_sort(a, 0, n - 1, maxele);
  }

  void merge_sort(List<int> a, int start, int end, int maxele) {
    //this function divides the array into 2 halves

    if (start < end) {
      int mid = (start + end) ~/ 2;
      merge_sort(a, start, mid, maxele);
      merge_sort(a, mid + 1, end, maxele);
      implement_merge_sort(a, start, mid, end, maxele);
    }
  }

  void implement_merge_sort(
      List<int> a, int start, int mid, int end, int maxele) {
    //implementation of mergesort
    int i = start;
    int j = mid + 1;
    int k = start;
    while (i <= mid && j <= end) {
      if (a[i] % maxele <= a[j] % maxele) {
        a[k] = a[k] + (a[i] % maxele) * maxele;
        k++;
        i++;
      } else {
        a[k] = a[k] + (a[j] % maxele) * maxele;
        k++;
        j++;
      }
    }
    while (i <= mid) {
      a[k] = a[k] + (a[i] % maxele) * maxele;
      k++;
      i++;
    }
    while (j <= end) {
      a[k] = a[k] + (a[j] % maxele) * maxele;
      k++;
      j++;
    }
    for (i = start; i <= end; i++) {
      a[i] = a[i] ~/ maxele;
    }
  }
}
