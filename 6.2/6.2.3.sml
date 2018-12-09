(*
Exercise 6.2.3

Write a function that takes a btree as its argument and returns a pair
consisting of the left and right subtrees. Define an exception for the erroneous
case where the tree is empty.

The definition of 'btree' is reproduced below.
*)

datatype 'label btree =
  Empty |
  Node of 'label * 'label btree * 'label btree;

(*
The solution to the exercise is provided below.
*)

exception EmptyTree;

fun split(Empty)         = raise EmptyTree
  | split(Node(_, l, r)) = (l, r);

