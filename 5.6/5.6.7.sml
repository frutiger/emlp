(*
Exercise 5.6.7

Using foldr and an anonymous function, write a function that takes a list of
reals [a0, a1, ... , an_i] and produces a function that takes an argument b and
evaluates the polynomial

  a0 + a1 x + a2 x^2 + ... + an_i x^n-l

at x = b, that is, it computes sum_{i=0}^{n-1} a_i b^i.
*)

val evalPoly = foldr (fn (a, acc) => fn x => x * acc x + a) (fn _ => 0.0);

