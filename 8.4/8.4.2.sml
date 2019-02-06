(*
Exercise 8.4.2

Give examples of:

a) Structures with signatures BTREE and TREE, as defined in Fig. 8.10, that
   satisfy the type-sharing constraints of lines (5) and (12) in that figure.
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

(* The solution to exercise 8.4.2(a) follows *)

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

structure IntTree: TREE = struct
  structure Element = Int;
  type elt = int;
  datatype tree = Tree of elt * tree list;
  fun build(x, T) = Tree(x, T);
  fun lookup1(x, nil) = false
    | lookup1(x, t::ts) = lookup(x, t) orelse lookup1(x, ts)
  and lookup(x, Tree(a, ts)) = x=a orelse lookup1(x, ts);
end;

(*
b) Structures that do not satisfy these type-sharing constraints.
*)

structure FailBTree: BTREE = struct
  structure Element = Int;
  type elt = char;
  datatype btree = Empty | Node of elt * btree * btree;
  fun leaf(x) = Node(x, Empty, Empty);
  fun build(x, l, r) = Node(x, l, r);
  fun lookup(x, Empty) = false
    | lookup(x, Node(y, l, r)) = x=y orelse lookup(x, l) orelse lookup(x, r);
end;

structure FailTree: TREE = struct
  structure Element = Int;
  type elt = char;
  datatype tree = Tree of elt * tree list;
  fun build(x, T) = Tree(x, T);
  fun lookup1(x, nil) = false
    | lookup1(x, t::ts) = lookup(x, t) orelse lookup1(x, ts)
  and lookup(x, Tree(a, ts)) = x=a orelse lookup1(x, ts);
end;

