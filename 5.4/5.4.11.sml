(*
Exercise 5.4.11

Another version of reduce takes a basis constant g of some type 'b, a function
F of type 'a * >b -> 'b, and a list of elements of type 'a.  The result applied
to a list [a1, a2, ..., an] is

  F(a1...F(an-1i,F(an, g))...)

Write a function reduceB that performs this operation.
*)

fun reduceB(F, nil, g)   = g
  | reduceB(F, x::xs, g) = F(x, reduceB(F, xs, g));

