(*
Exercise 5.4.9

Write a function lreduce that takes a two-parameter function F and a list [a1,
a2, ..., an] and produces

  F(...F(F(a1, a2), a3) ..., an)

That is, this function is like reduce, but it groups the elements of the list
from the beginning of the list instead of the end.
*)

exception EmptyList;

fun lreduce(F, nil)         = raise EmptyList
  | lreduce(F, x1::nil)     = x1
  | lreduce(F, x1::x2::nil) = F(x1, x2)
  | lreduce(F, x1::x2::xs)  = lreduce(F, F(x1, x2)::xs);

