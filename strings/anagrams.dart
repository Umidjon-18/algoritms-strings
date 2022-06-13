
void main(List<String> args) {
  
  print(approach3("asdfew", "fewsad"));
}

bool approach1(String s, String t) {
        if (s.length != t.length) {
            return false;
        } else {
            var c = s.split("");
            var d = t.split("");
            c.sort();
            d.sort();    /* In this approach the strings are stored in the character arrays and both the arrays are sorted. After that both the arrays are compared for checking anangram */
            if (c.any((item) => d.contains(item))) {
                return true;
            } else {
                return false;
            }
        }
    }



bool approach2(String a, String b) {
        if (a.length != b.length) {
            return false;
        } else {
            var m = [];
            var n = [];
            for (String c in a.split("")) {
                m.add(c);
            }
            // In this approach the frequency of both the strings are stored and after that the frequencies are iterated from 0 to 26(from 'a' to 'z' ). If the frequencies match then anagram message is displayed in the form of boolean format
            // Running time and space complexity of this algo is less as compared to others
            for (String c in b.split("")) {
                n.add(c);
            }
            m.sort();
            n.sort();
            for (int i = 0; i < m.length; i++) {
                if (m[i] != n[i]) {
                    return false;
                }
            }
            return true;
        }
    }

     bool approach3(String s, String t) {
        if (s.length != t.length) {
            return false;
        }
        // this is similar to approach number 2 but here the string is not converted to character array
        else {
            var a = [];
            var b = [];
            int k = s.length;
            for (int i = 0; i < k; i++) {
                a.add(s[i]);
                b.add(t[i]);
            }
            a.sort();
            b.sort();
            for (int i = 0; i < k; i++) {
                if (a[i] != b[i])
                    return false;
            }
            return true;
        }   
    }

    // bool approach4(String s, String t) {
    //     if (s.length != t.length) {
    //         return false;
    //     }
    //     // This approach is done using hashmap where frequencies are stored and checked iteratively and if all the frequencies of first string match with the second string then anagram message is displayed in boolean format
    //     else {
    //         HashMap<Character, Integer> nm = new HashMap<>();
    //         HashMap<Character, Integer> kk = new HashMap<>();
    //         for (char c : s.toCharArray()) {
    //             nm.put(c, nm.getOrDefault(c, 0) + 1);
    //         }
    //         for (char c : t.toCharArray()) {

    //             kk.put(c, kk.getOrDefault(c, 0) + 1);
    //         }
    //         // It checks for equal frequencies
    //         for (char c : nm.keySet()) {
    //             if (!nm.get(c).equals(kk.get(c))) {
    //                 return false;
    //             }
    //         }
    //         return true;
    //     }
    // }