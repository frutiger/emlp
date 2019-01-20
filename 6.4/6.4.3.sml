(*
Exercise 6.4.3

Write a function that takes a general tree T and returns the depth of T, that
is, the maximum length of a path from the root to a leaf in T.

The definition of a general rooted tree is provided below.
*)
datatype ('a) tree = Node of 'a * 'a tree list;
(*
a) Using the recursive style of Section 6.4.2.
*)

fun max(a, b) = if a<b then b else a;

fun depthR1(nil)   = 1
  | depthR1(t::ts) = max(depthR(t), depthR1(ts))

and depthR(Node(_, nil)) = 1
  | depthR(Node(a, L))   = 1 + depthR1(L)

(*
b) Using higher-order functions, as in Section 6.4.3.
*)

fun depthH(Node(_, L)) = 1 + foldr max 0 (map depthH L);

