(*
Exercise 9.3.1

Write a function that takes two lists of integers, compares them
lexicographically, returning a value of type order.
*)

fun compareLists(nil, nil) = EQUAL
  | compareLists(_,   nil) = GREATER
  | compareLists(nil, _)   = LESS
  | compareLists(x::xs, y::ys) = if x < y
                                 then LESS
                                 else if x > y
                                      then GREATER
                                      else compareLists(xs, ys);

