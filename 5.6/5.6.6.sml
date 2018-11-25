(*
Exercise 5.6.6

Write a version of the function filter from Section 5.4.5 that takes only a
predicate P as argument and produces a function that takes a list of elements
of suitable type and returns those elements on the list that satisfy P.

The definition of filter from Section 5.4.5 is reproduced below

fun filter(P,nil) = nil
  | filter(P,x::xs) =
      if P(x) then x::filter(P,xs)
      else filter(P,xs);
val filter = fn : ('a —> bool) * 'a list —> 'a list
*)

fun filter P nil = nil
  | filter P (x::xs) = if P x then x::filter P xs else filter P xs;

