(*
Exercise 3.3.13

Suppose sets are represented by lists as in Exercise 3.3.12 [sic].  The power
set of a set S is the set of all subsets of S.  A set of sets can be represented
in ML by a list whose elements are lists.  For example, if S is the set {1, 2},
then the power set of S is {Ø, {1}, {2}, {1, 2}}, where Ø is the empty set.
This power set can be represented in ML by the list of lists [nil, [1], [2], [1,
2]].  That is, the elements of the lists are themselves lists, each representing
one of the subsets of S.  Write a function that takes a list as argument,
representing some set S, and produces the power set of S.  Hint: Recursively
construct the power set for the tail of the list and use the function from
Exercise 3.3.12 to help construct the power set for the whole list.
*)

fun prependAll(x, xs::xss) = (x::xs)::prependAll(x, xss)
  | prependAll(x, nil)     = nil;

fun powerset(x::xs) = prependAll(x, powerset(xs)) @ powerset(xs)
  | powerset(nil) = [nil];

