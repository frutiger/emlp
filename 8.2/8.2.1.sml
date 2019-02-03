(*
Exercise 8.2.1

Define a structure Tree with a datatype tree representing general trees as in
Section 6.4 and the following operations:

1. create(a) returns a one-node tree with label a.

2. build(a, L) returns a tree with a root labeled a and list of subtrees L for
   the root.

3. find(i, T) finds the ith subtree of the root of tree T and raises the
   exception Missing if there is no such subtree.
*)

structure Tree = struct
  exception Missing;

  datatype 'a tree = Node of 'a * 'a tree list;

  fun create(a) = Node(a, []);

  fun build(a, L) = Node(a, L);

  fun find(i, Node(a, nil))   = raise Missing
    | find(1, Node(a, n::ns)) = n
    | find(i, Node(a, n::ns)) = find(i-1, Node(a, ns));
end;

