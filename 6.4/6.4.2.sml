(*
Exercise 6.4.2

Write a function that takes a general tree T and an element x and returns the
number of times that x appears as a label in T.

The definition of a general rooted tree is provided below.
*)
datatype ('a) tree = Node of 'a * 'a tree list;
(*
a) Using the recursive style of Section 6.4.2.
*)

fun countR(Node(a, nil),   x) = if a=x then 1 else 0
  | countR(Node(a, t::ts), x) = countR(t, x) + countR(Node(a, ts), x);

(*
b) Using higher-order functions, as in Section 6.4.3.
*)

fun countH(Node(a, L), x) = (if a=x then 1 else 0) +
                            foldr (op +) 0 (map (fn t => countH(t, x)) L);

