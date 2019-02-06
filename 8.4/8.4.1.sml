(*
Exercise 8.4.1

Give an example of a structure S that can be Element in line (3) of Fig. 8.10
and a structure with signature BTREE (as defined in lines (3) through (9) of
that figure) that uses structure S at line (3) and satisfies the type-sharing
constraint of line (5). Then, give another example of a structure with signature
BTREE that uses the structure S but does not satisfy the sharing constraint.
*)

(* Fig. 8.10 is reproduced below *)

signature ELEMENT = sig
  type element;
  val similar : element * element -> bool;
end;

signature BTREE = sig
  structure Element: ELEMENT;
  eqtype elt;
  sharing type elt = Element.element;
  datatype btree = Empty | Node of elt * btree * btree;
  val leaf : elt -> btree;
  val build : elt * btree * btree -> btree;
  val lookup : elt * btree -> bool
end;

signature TREE = sig
  structure Element: ELEMENT;
  eqtype elt;
  sharing type elt = Element.element;
  datatype tree = Tree of elt * tree list;
  val build : elt * tree list -> tree;
  val lookup : elt * tree -> bool
end;

signature ALLTREES = sig
  structure Btree: BTREE;
  structure Tree: TREE;
  sharing Btree.Element = Tree.Element;
  sharing type Btree.elt = Tree.elt
end;

(* The solution to exercise 8.4.1 follows *)

structure Int: ELEMENT = struct
  type element = int;
  fun similar(x:int, y) = x=y;
end;

structure IntBTree: BTREE = struct
  structure Element = Int;
  type elt = int;
  datatype btree = Empty | Node of elt * btree * btree;
  fun leaf(x) = Node(x, Empty, Empty);
  fun build(x, l, r) = Node(x, l, r);
  fun lookup(x, Empty) = false
    | lookup(x, Node(y, l, r)) = x=y orelse lookup(x, l) orelse lookup(x, r);
end;

structure FailBTree: BTREE = struct
  structure Element = Int;
  type elt = char;
  datatype btree = Empty | Node of elt * btree * btree;
  fun leaf(x) = Node(x, Empty, Empty);
  fun build(x, l, r) = Node(x, l, r);
  fun lookup(x, Empty) = false
    | lookup(x, Node(y, l, r)) = x=y orelse lookup(x, l) orelse lookup(x, r);
end;

