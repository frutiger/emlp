(*
Exercise 6.3.5

There is a subtle problem with the function preOrder defined in Section 6.3.7.
Since concatenation is implemented in ML by copying the first of the two lists
involved, a call to preOrder on a given node N takes time proportional to the
length of the preorder listing of the left subtree of N, plus the time to
compute the preorder listings of all subtrees of N. Thus in the worst case (a
tree with a long path extending to the left), this function can take time
proportional to the square of the number of nodes in the tree. In conventional
languages, a typical implementation of preorder traversal will take time that is
linear in the number of nodes. Write a function preOrder that takes time
proportional to the number of nodes. Hint: Use the "difference-list" trick
discussed in Section 3.5. That is, write an auxiliary function preOrder1(T,L)
that produces the preorder listing of a tree T followed by the arbitrary list L.
We define preOrder(T) to call preOrder1(T,nil), but preOrder1 calls itself
recursively and gradually builds up the preorder listing in the second
component. By so doing, we can avoid using @ and can build our listing using
only the cons operator ::.

The definition of 'preOrder' from Section 6.3.7. is reproduced below.

fun preOrder(Empty) = nil
  | preOrder(Node(a,left,right)) =
      [a] @ preOrder(left) @ preOrder(right);
*)

fun preOrder1(Empty,         L) = L
  | preOrder1(Node(a, l, r), L) = a::preOrder1(l, preOrder1(r, L));

fun preOrder(T) = preOrder1(T, nil);

