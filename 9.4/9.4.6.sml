(*
Exercise 9.4.6

Write the following functions using contains from the structure Char:

a) A function that tells whether a character is a vowel.
*)

val isVowel = Char.contains "AEIOUaeiou";

(*
b) A function that tells whether a character is an even digit.
*)

val isEvenDigit = Char.contains "02468";

(*
c) A function that tells whether a character is a 1-point letter in Scrabble.
*)

val isScrabbleOnePointer = Char.contains "AEILNORSTUaeilnorstu";
