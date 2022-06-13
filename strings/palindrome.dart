void main(List<String> args) {}

bool isPalindrome(String s) {
  var reversed = s.split("").reversed.toString();
  var result = s.compareTo(reversed) == 0 ? true:false;
  return s.length <= 1 || result;
}


 bool isPalindromeRecursion(String? s) {
        if (s == null || s.length <= 1) {
            return true;
        }

        if (s[0] != s[s.length - 1]) {
            return false;
        }

        return isPalindrome(s.substring(1, s.length - 1));
    }

bool isPalindrome1(String? s) {
        if (s == null || s.length <= 1) {
            return true;
        }
        for (int i = 0, j = s.length - 1; i < j; ++i, --j) {
            if (s[i] != s[j]) {
                return false;
            }
        }
        return true;
    }