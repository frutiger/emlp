(*
Exercise 6.2.2

Define a type (not a datatype) mapTree that is a specialization of the btree
datatype to have a label type that is a set of domain-range pairs. Then, define
a tree tl that has a single node with the pair ("a", 1) at the root.

The definition of 'btree' is reproduced below.
*)

datatype 'label btree =
  Empty |
  Node of 'label * 'label btree * 'label btree;

(*
The solution to the exercise is provided below.
*)

type ('domain, 'range) mapTree = ('domain * 'range) btree;

val tl =
  Node(
    ("a", 1),
    Empty,
    Empty) : (string, int) mapTree;

