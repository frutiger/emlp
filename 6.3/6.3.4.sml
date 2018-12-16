(*
Exercise 6.3.4

Suppose we have a set S of integers, and we want to write a program that will
tell whether a given integer i is a member of S in time proportional to the
logarithm of the number of members of S. Show how to create such a function by
partially instantiating the function lookup of Fig. 6.9.

The definition of 'btree', 'lookup', 'insert', and 'delete' are provided below.
*)
datatype 'label btree
  = Empty
  | Node of 'label * 'label btree * 'label btree;

fun lookup lt Empty x = false
  | lookup lt (Node(y,left,right)) x =
      if lt(x,y)
      then lookup lt left x
      else if lt(y,x)
        then lookup lt right x
        else true;

fun contains S x = lookup (Int.<) S x;

