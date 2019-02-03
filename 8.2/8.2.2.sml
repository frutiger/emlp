(*
Exercise 8.2.2

Note that in Exercise 8.2.1 create(a) means the same as build(a, nil). We may
thus wish to define a new structure SimpleTree that has all the elements of
structure Tree except create. Also, we may choose to restrict simple trees to
have integer labels. Write a signature SIMPLE that makes these restrictions.
Then use SIMPLE and Tree to define structure SimpleTree.
*)

use "8.2/8.2.1.sml";

signature SIMPLE = sig
  exception Missing;

  type 'a tree;

  val build: int * int tree list -> int tree;
  val find: int * int tree -> int tree;
end;

structure SimpleTree: SIMPLE = Tree;

