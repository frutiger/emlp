(*
The simple rule for translating into "Pig Latin" is to take a word that begins
with a vowel and add "yay", while taking any word that begins with one more
consonants and transferring them to the back before appending "ay".  For
example, "able" becomes "ableyay" and "stripe" becomes "ipestray".  Write a
function that converts a string of letters into its Pig-Latin translation.
Hint: use explode and the function from Exercise 3.3.9 that tests for vowels. *)

fun isFirstVowel(#"a"::_) = true
  | isFirstVowel(#"e"::_) = true
  | isFirstVowel(#"i"::_) = true
  | isFirstVowel(#"o"::_) = true
  | isFirstVowel(#"u"::_) = true
  | isFirstVowel(_)       = false;

fun cycleOnce(nil)   = nil
  | cycleOnce(x::xs) = xs @ [x];

fun pigLatin1(xs, suffix) = if isFirstVowel(xs) then concat([implode(xs), suffix])
                                                else pigLatin1(cycleOnce(xs), "ay");
fun pigLatin(x) = pigLatin1(explode(x), "yay");

