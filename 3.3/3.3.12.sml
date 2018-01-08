(*
Exercise 3.3.12

Write a function that takes an element a and a list L of lists of elements as
the same type as a and inserts a onto the front of each of the lists on the list
L.  For example, if a = 1 and if L is [[2, 3], [4, 5, 6], nil] then the result
is [[1, 2, 3], [1, 4, 5, 6], [1]].
*)

fun prependAll(x, xs::xss) = (x::xs)::prependAll(x, xss)
  | prependAll(x, nil)     = nil;

