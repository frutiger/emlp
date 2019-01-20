(*
Exercise 6.4.1

Write a function that takes a general tree T and an element x and tells whether
or not x appears as a label of T.

The definition of a general rooted tree is provided below.
*)
datatype ('a) tree = Node of 'a * 'a tree list;
(*
a) Using the recursive style of Section 6.4.2.
*)

fun containsR(Node(a, nil),   x) = a=x
  | containsR(Node(a, t::ts), x) = containsR(t, x) orelse
                                   containsR(Node(a, ts), x);

(*
b) Using higher-order functions, as in Section 6.4.3.
*)

fun containsH(Node(a, L), x) = (a=x) orelse
                               foldr (fn (x, y) => x orelse y)
                                     false
                                     (map (fn t => containsH(t, x)) L);

