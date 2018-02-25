(*
Exercise 3.6.3

Write a function to evaluate a polynomial at a given real value a.  That is,
define a function eval(P, a) that takes a list (polynomial) P and a real number
a, and computes P(a).
*)

fun eval1(nil,   x, a) = 0
  | eval1(p::ps, x, a) = p * x + eval1(ps, a * x, a);

fun eval(ps, a) = eval1(ps, 1, a);

