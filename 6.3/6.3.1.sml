(*
Exercise 6.3.1

Write functions to list the nodes of a binary tree in:

a) Postorder, in which the label at the root follows the postorder traversals
   of the left and right subtrees.
*)

(*
The type of 'btree':
*)
datatype 'label btree = Empty | Node of 'label * 'label btree * 'label btree;

fun postorder(Empty) = []
  | postorder(Node(a, l, r)) = postorder(l) @ postorder(r) @ [a];

(*
b) Inorder, in which the label of the root is in between the inorder traversals
   of the left and right subtrees.
*)

fun inorder(Empty) = []
  | inorder(Node(a, l, r)) = inorder(l) @ [a] @ inorder(r);

