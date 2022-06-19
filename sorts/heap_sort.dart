import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  
}

class Heap<T extends Comparable<T>> with SortUtils{

        /**
         * Array to store heap
         */
         late List<T> heap;

        /**
         * Constructor
         *
         * @param heap array of unordered integers
         */
         Heap(List<T> heap) {
            this.heap = heap;
        }

        /**
         * Heapifies subtree from top as root to last as last child
         *
         * @param rootIndex index of root
         * @param lastChild index of last child
         */
         void heapSubtree(int rootIndex, int lastChild) {
            int leftIndex = rootIndex * 2 + 1;
            int rightIndex = rootIndex * 2 + 2;
            T root = heap[rootIndex];
            if (rightIndex <= lastChild) { // if has right and left children
                T left = heap[leftIndex];
                T right = heap[rightIndex];
                if (less(left, right) && less(left, root)) {
                    swap(heap, leftIndex, rootIndex);
                    heapSubtree(leftIndex, lastChild);
                } else if (less(right, root)) {
                    swap(heap, rightIndex, rootIndex);
                    heapSubtree(rightIndex, lastChild);
                }
            } else if (leftIndex <= lastChild) { // if no right child, but has left child
                T left = heap[leftIndex];
                if (less(left, root)) {
                    swap(heap, leftIndex, rootIndex);
                    heapSubtree(leftIndex, lastChild);
                }
            }
        }

        /**
         * Makes heap with root as root
         *
         * @param root index of root of heap
         */
        void makeMinHeap(int root) {
            int leftIndex = root * 2 + 1;
            int rightIndex = root * 2 + 2;
            bool hasLeftChild = leftIndex < heap.length;
            bool hasRightChild = rightIndex < heap.length;
            if (hasRightChild) { // if has left and right
                makeMinHeap(leftIndex);
                makeMinHeap(rightIndex);
                heapSubtree(root, heap.length - 1);
            } else if (hasLeftChild) {
                heapSubtree(root, heap.length - 1);
            }
        }

        /**
         * Gets the root of heap
         *
         * @return root of heap
         */
        T getRoot(int size) {
            swap(heap, 0, size);
            heapSubtree(0, size - 1);
            return heap[size]; // return old root
        }
    }

 class HeapSort implements SortAlgorithm {

    

    @override
    List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
        return sort2(Arrays.asList(unsorted)).toArray(unsorted);
    }

    List<T> sort2<T extends Comparable<T>>(List<T> unsorted) {
        int size = unsorted.length;

        @SuppressWarnings("unchecked")
        Heap<T> heap = Heap(unsorted.toList);

        heap.makeMinHeap(0); // make min heap using index 0 as root.
        List<T> sorted = [];
        while (size > 0) {
            T min = heap.getRoot(--size);
            sorted.add(min);
        }

        return sorted;
    }

    
}