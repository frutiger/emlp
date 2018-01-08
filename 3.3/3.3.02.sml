(*
Exercise 3.3.2

Write a function that flips alternate elements in a list.  That is, given a list
[a1, a2, ..., an] as argument, produce [a2, a1, a4, a3, a6, a5, ...].  If n is
odd, an remains at the end *)

fun alternateElements(x1::x2::xs) = x2::x1::alternateElements(xs)
  | alternateElements(xs) = xs;

