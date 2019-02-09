(*
Exercise 8.5.2

Write a signature that will not allow the functions other than create, lookup,
and insert to be available through your 2-3-tree structure of Exercise 8.5.1.
Then, create a new structure that will offer the user 2-3 trees with only these
three functions available.
*)

signature TWOTHREETHREE = sig
  type Tree;

  val create: int -> Tree;
  val lookup: Tree * int -> bool;
  val insert: Tree * int -> Tree;
end;

use "8.5/8.5.1.sml";

structure TwoThreeTree = TwoThreeTree: TWOTHREETHREE;

