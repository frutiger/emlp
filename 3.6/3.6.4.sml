(*
Exercise 3.6.4

Given a list of reals [a1, a2, ..., an], find a polynomial whose roots are a1,
a2, ..., an.  Hint: Note that this polynomial is the product of (x - ai) for i =
1, 2, ..., n.
*)

use "3.6/3.6.2.sml";

fun polyFromRoots(x::nil) = [~1.0 * x, 1.0]
  | polyFromRoots(x::xs)  = pmult([~1.0 * x, 1.0], polyFromRoots(xs));

