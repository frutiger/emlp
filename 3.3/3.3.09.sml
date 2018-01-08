(*
Exercise 3.3.9

Write a function that takes a list of characters and returns true if the first
element is a vowel and false if not.  Use the wildcard symbol _ whenever
possible in the patterns. *)

fun isFirstVowel(#"a"::_) = true
  | isFirstVowel(#"e"::_) = true
  | isFirstVowel(#"i"::_) = true
  | isFirstVowel(#"o"::_) = true
  | isFirstVowel(#"u"::_) = true
  | isFirstVowel(_)       = false;

