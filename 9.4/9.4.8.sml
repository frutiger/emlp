(*
Exercise 9.4.8

Use operations from the structure Substring to write functions that:

a) Reverse a string.
*)

fun reverseString(s) = Substring.foldr (fn (c, s) => (s ^ Char.toString(c))) ""
                                       (Substring.full(s));

(*
b) Produce the odd-numbered positions of a string. For example, given "abcdef",
produce "bdf".
*)

fun oddChars1(NONE) = ""
  | oddChars1(SOME (c, s)) = Char.toString(c) ^ oddChars2(Substring.getc(s))

and oddChars2(NONE) = ""
  | oddChars2(SOME (_, s)) = oddChars1(Substring.getc(s))

fun oddChars(s) = oddChars1(Substring.getc(Substring.full(s)));

