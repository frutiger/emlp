(*
Exercise 5.5.3

Write a function substring, either Curried or not, that takes two parameters
and tests whether the first is a substring of the other. String x is a
substring of string y if we can write y as the concatenation of strings w, x,
and z. It is permissible for any of the strings to be empty. For example, "abc"
has substrings including "", "b", and "ab". Using makeFnList of Exercise 5.5.2,
construct a function f that takes a list of strings [s1, s2, ..., sn] and
produces a list of functions [F1, F2,..., Fn], such that Fi(x) tells whether si
is a substring of x.
*)

use "5.5/5.5.2.sml";

fun prefix(nil,   _)     = true
  | prefix(_,     nil)   = false
  | prefix(x::xs, y::ys) = if   x=y
                           then prefix(xs, ys)
                           else false

fun substring1(nil,   _)      = true
  | substring1(_,     nil)    = false
  | substring1(x::xs, y::ys) = if x=y
                               then prefix(xs, ys)
                               else substring1(x::xs, ys);

fun substring x y = substring1(explode x, explode y);

val substringList = makeFnList substring;

