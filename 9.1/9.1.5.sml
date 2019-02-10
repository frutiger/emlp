(*
Exercise 9.1.5

The binary tree datatype of Fig. 9.2 follows.
*)
datatype 'a btree = T of 'a btree * 'a btree |
                    Leaf of 'a;

(*
For the binary tree datatype of Fig. 9.2, write a function that

a) Sums the labels of the leaves of a tree, assuming labels are reals.
*)

fun sum(Leaf(x:real)) = x
  | sum(T(l, r))      = sum(l) + sum(r);

(*
b) Sums the labels of those leaves that have a leaf for a sibling. Siblings are
   nodes that have the same parent.
*)

fun sumLeafSiblings(Leaf(x:real))     = x
  | sumLeafSiblings(T(T(l, r), _   )) = sumLeafSiblings(l) + sumLeafSiblings(r)
  | sumLeafSiblings(T(_,    T(l, r))) = sumLeafSiblings(l) + sumLeafSiblings(r)
  | sumLeafSiblings(T(l,    r   ))    = sumLeafSiblings(l) + sumLeafSiblings(r)

