import 'dart:io';

void main(List<String> args) {
      
    
}

class SaddlebackSearch {

    /**
     * This method performs Saddleback Search
     *
     * @param arr The **Sorted** array in which we will search the element.
     * @param row the current row.
     * @param col the current column.
     * @param key the element that we want to search for.
     * @return The index(row and column) of the element if found. Else returns
     * -1 -1.
     */
    List<int> find(List<List<int>> arr, int row, int col, int key) {

        // array to store the answer row and column
        List<int> ans = [-1, -1];
        if (row < 0 || col >= arr[row].length) {
            return ans;
        }
        if (arr[row][col] == key) {
            ans[0] = row;
            ans[1] = col;
            return ans;
        } // if the current element is greater than the given element then we move up
        else if (arr[row][col] > key) {
            return find(arr, row - 1, col, key);
        }
        // else we move right
        return find(arr, row, col + 1, key);
    }

    
}