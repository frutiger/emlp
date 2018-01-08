(*
Exercise 3.3.3

Write a function that, given a list L and an integer i, returns a copy of L with
the ith element deleted.  If the length of L is less than i, return L. *)

fun del(x::xs, 0) = xs
  | del(x::xs, i) = x::del(xs, i - 1)
  | del(nil,   i) = nil;

