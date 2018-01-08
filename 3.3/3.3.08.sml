(*
Exercise 3.3.8

Write a function that takes a list of pairs of integers, and orders the elements
of each pair such that the smallest number is first.  Use the as construct, so
that you can refer to the pair as a whole when it is not necessary to change it.
*)

fun orderPairs((x as (x1, x2))::xs) = if x1 < x2 then x::orderPairs(xs)
                                                 else (x2, x1)::orderPairs(xs)
  | orderPairs(nil)                 = nil;

