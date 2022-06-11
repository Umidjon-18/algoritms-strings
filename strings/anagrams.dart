import 'dart:ffi';

void main(List<String> args) {
  
}

bool approach1(String s, String t) {
        if (s.length != t.length) {
            return false;
        } else {
            var c = s.split("");
            var d = t.split("");
            c.sort();
            d.sort();    /* In this approach the strings are stored in the character arrays and both the arrays are sorted. After that both the arrays are compared for checking anangram */
            if () {
                return true;
            } else {
                return false;
            }
        }
    }