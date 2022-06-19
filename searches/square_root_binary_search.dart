import 'dart:io';

void main(List<String> args) {
   
        print("Enter a number you want to calculate square root of : ");
        int nu = int.parse(stdin.readLineSync()!);
        num ans = SquareRootBinarySearch().squareRoot(nu);
        print("The square root is : $ans");
}

class SquareRootBinarySearch {

    /**
     * This function calculates the floor of square root of a number. We use
     * Binary Search algorithm to calculate the square root in a more optimised
     * way.
     *
     * @param num Number
     * @return answer
     */
    num squareRoot(num nu) {
        if (nu == 0 || nu == 1) {
            return nu;
        }
        num l = 1;
        num r = nu;
        num ans = 0;
        while (l <= r) {
            num mid = l + (r - l) / 2;
            if (mid == nu / mid) {
                return mid;
            } else if (mid < nu / mid) {
                ans = mid;
                l = mid + 1;
            } else {
                r = mid - 1;
            }
        }
        return ans;
    }
}