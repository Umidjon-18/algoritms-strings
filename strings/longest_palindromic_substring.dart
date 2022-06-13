import 'dart:io';

void main(List<String> args) {
  Solution s = new Solution();
  print("Enter the string: ");
  String str  = stdin.readLineSync()!;
  print("Longest substring is : " + s.longestPalindrome(str));

  }

// Longest Palindromic Substring

class Solution {

    String longestPalindrome(String? s) {
        if (s == null || s.length == 0) {
            return "";
        }
        int n = s.length;
        String maxStr = "";
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                if (isValid(s, i, j) == true) {
                    if (j - i + 1 > maxStr.length) { // update maxStr
                        maxStr = s.substring(i, j + 1);
                    }
                }
            }
        }
        return maxStr;
    }

    bool isValid(String s, int lo, int hi) {
        int n = hi - lo + 1;
        for (int i = 0; i < n / 2; ++i) {
            if (s[lo + i] != s[hi - i]) {
                return false;
            }
        }
        return true;
    }
}