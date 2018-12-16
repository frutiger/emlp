(*
Exercise 6.3.2

Suppose we define the type mapTree as in Exercise 6.2.2 (see the solutions if
you have not worked this exercise yourself). This type is a binary tree whose
labels are pairs, which we may think of as the domain and range values of a pair
in some mapping. We may use a mapTree as a sort of binary search tree, if we use
a < ordering on the domain (first) component of each pair only.

a) Write a function lookup lt T a that searches tree T for a pair (a, b) for
   some b and returns b. The comparison function lt compares domain elements of
   the pairs at the nodes of tree T and guides our search down the tree. If
   there is no such pair, then raise the exception Missing.
*)

(*
The type of 'btree' is provided below:
*)
datatype 'label btree = Empty | Node of 'label * 'label btree * 'label btree;

exception Missing;

fun lookup lt Empty a = raise Missing
  | lookup lt (Node((k, v), L, R)) a =
      if lt(a, k)
        then lookup lt L a
        else if lt (k, a)
          then lookup lt R a
          else v;

(*
b) Write a function assign lt T a b that looks in tree T for a pair (a,c) and,
   if found, replaces c by b. If no such pair is found, assign inserts the pair
   (a, b) in the tree in a position that preserves the BST property. As in (a),
   comparison function lt applies to domain elements of the pairs and guides the
   search down the tree T.
*)

fun assign lt Empty a b = Node((a, b), Empty, Empty)
  | assign lt (Node((k, v), L, R)) a b =
      if lt(a, k)
        then Node((k, v), assign lt L a b, R)
        else if lt(k, a)
          then Node((k, v), L, assign lt R a b)
          else Node((k, b), L, R);

