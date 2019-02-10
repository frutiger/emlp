(*
Exercise 9.3.2

Write a function f(s, t, i) that tells if the last i positions of string s are
lexicographically less than the last i positions of string t, returning a value
of type order. If either or both of s and t are shorter than i, use the entire
string as the "last i positions."
*)

fun f1(x::xs, y::ys, 0) = EQUAL
  | f1(nil,   _,     _) = EQUAL
  | f1(_,     nil,   _) = EQUAL
  | f1(x::xs, y::ys, i) = if x < y
                          then LESS
                          else if x > y
                               then GREATER
                               else f1(xs, ys, i-1)

fun f(s, t, i) = f1(rev(map ord (explode(s))), rev(map ord (explode(t))), i);

