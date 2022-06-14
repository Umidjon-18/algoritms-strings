import 'dart:math';

void main(List<String> args) {
  List<int> arr = List.filled(10, 0);

  /* generate 10 random numbers from -50 to 49 */
  Random random = new Random();
  for (int i = 0; i < arr.length; ++i) {
    arr[i] = random.nextInt(100) - 50;
  }

  BucketSort().bucketSort(arr);
  print(arr);
}

class BucketSort {
  /**
     * BucketSort algorithms implements
     *
     * @param arr the array contains elements
     */
  void bucketSort(List<int> arr) {
    /* get max value of arr */
    int max = arr.reduce((curr, next) => curr > next ? curr : next);

    /* get min value of arr */
    int min = arr.reduce((curr, next) => curr < next ? curr : next);

    /* number of buckets */
    int numberOfBuckets = max - min + 1;

    List<List<int>> buckets = [];

    /* init buckets */
    for (int i = 0; i < numberOfBuckets; ++i) {
      List<int> list = [];
      buckets.add(list);
    }

    /* store elements to buckets */
    for (int value in arr) {
      int hashs = hash(value, min, numberOfBuckets);
      buckets[hashs].add(value);
    }

    /* sort individual bucket */
    for (List<int> bucket in buckets) {
      bucket.sort();
    }

    /* concatenate buckets to origin array */
    int index = 0;
    for (List<int> bucket in buckets) {
      for (int value in bucket) {
        arr[index++] = value;
      }
    }
  }

  /**
     * Get index of bucket which of our elements gets placed into it.
     *
     * @param elem the element of array to be sorted
     * @param min min value of array
     * @param numberOfBucket the number of bucket
     * @return index of bucket
     */
  int hash(int elem, int min, int numberOfBucket) {
    return (elem - min) ~/ numberOfBucket;
  }

  /**
     * Calculate max value of array
     *
     * @param arr the array contains elements
     * @return max value of given array
     */
  int max(List<int> arr) {
    int max = arr[0];
    for (int value in arr) {
      if (value > max) {
        max = value;
      }
    }
    return max;
  }

  /**
     * Calculate min value of array
     *
     * @param arr the array contains elements
     * @return min value of given array
     */
  int min(List<int> arr) {
    int min = arr[0];
    for (int value in arr) {
      if (value < min) {
        min = value;
      }
    }
    return min;
  }
}
