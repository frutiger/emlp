(*
Exercise 3.4.7

Write a function that takes a list of integers as argument and returns a pair
consisting of the sum of the even positions and the sum of the odd positions of
the list.  You should not use any auxiliary functions.
*)

fun sumAlternates(nil)    = (0, 0)
  | sumAlternates(x::nil) = (x, 0)
  | sumAlternates(x1::x2::xs) =
  let
    val (x1s, x2s) = sumAlternates(xs)
  in
    (x1 + x1s, x2 + x2s)
  end;

