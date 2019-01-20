(*
Exercise 6.4.4

Write a function to list the labels of the nodes of a general tree in preorder,

The definition of a general rooted tree is provided below.
*)
datatype ('a) tree = Node of 'a * 'a tree list;
(*
a) Using the recursive style of Section 6.4.2.
*)

fun listTreeR1(nil)   = nil
  | listTreeR1(t::ts) = listTreeR(t) @ listTreeR1(ts)

and listTreeR(Node(a, nil)) = [a]
  | listTreeR(Node(a, L))   = [a] @ listTreeR1(L);

(*
b) Using higher-order functions, as in Section 6.4.3.
*)

fun listTreeH(Node(a, L)) = [a] @ foldr (op @) [] (map listTreeH L);

