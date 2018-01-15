(*
Exercise 3.4.3

Improve upon the power-set function of Exercise 3.3.13 by using a let
expression and computing the power-set of the tail only once.

The solution to Exercise 3.3.13 is reproduced below.

fun prependAll(x, xs::xss) = (x::xs)::prependAll(x, xss)
  | prependAll(x, nil)     = nil;

fun powerset(x::xs) = prependAll(x, powerset(xs)) @ powerset(xs)
  | powerset(nil) = [nil];
*)

fun prependAll(x, xs::xss) = (x::xs)::prependAll(x, xss)
  | prependAll(x, nil)     = nil;

fun powerset(x::xs) =
  let
    val tailPowerset = powerset(xs)
  in
    prependAll(x, tailPowerset) @ tailPowerset
  end
  | powerset(nil) = [nil];

