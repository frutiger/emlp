(*
Exercise 5.4.5

Use the function simpleMap(F,L) to perform the following operations on a list
L.

   (a) Replace every negative element of a list of reals by 0, leaving
   nonnegative elements as they are. *)

fun F1(x) = if x >= 0.0 then x else ~1.0 * x;

(* (b) Add 1 to every element of an integer list.  *)

fun F2(x) = x + 1;

(* (c) Change every lower-case letter in a list of characters to the
   corresponding upper-case letter. Do not assume that only lower-case letters
   appear in the list.  *)

fun F3(c) = if ord(c) >= ord(#"a") then chr(ord(c) - 0x20) else c;

(* (d) Truncate each string in a list of strings so it is no more than 5
   characters long. That is, delete the sixth and subsequent characters while
   leaving shorter strings alone.  *)

fun F41(cs) = if length(cs) > 5 then List.take(cs, 5) else cs;
fun F4(s) = implode(F41(explode(s)));
