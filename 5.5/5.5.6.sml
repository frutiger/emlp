(*
Exercise 5.5.6

Repeat Exercise 5.5.3 for subsequences in place of substrings.  String x is a
subsequence of string y if x is formed by striking out zero or more positions
of y. For example, "ac" is a subsequence of "abc" but is not a substring.
Then, as in Exercise 5.5.4, create a list of functions that test whether the
following strings are subsequences of a given string:

  ["ear", "part", "trap", "seat"]

Finally, apply your list of functions to the string "separate".
*)

use "5.5/5.5.1.sml";
use "5.5/5.5.2.sml";

fun subseq1(nil,   _)      = true
  | subseq1(_,     nil)    = false
  | subseq1(x::xs, y::ys) = if x=y
                            then subseq1(xs,    ys)
                            else subseq1(x::xs, ys);

fun subseq x y = subseq1(explode x, explode y);

val specSubseqList = makeFnList subseq ["ear", "part", "trap", "seat"];

applyList specSubseqList "separate";

