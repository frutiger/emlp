(*
Exercise 6.3.3

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

fun insert lt Empty x = Node(x,Empty,Empty)
  | insert lt (T as Node(y,left,right)) x =
      if lt(x,y)
      then Node(y,(insert lt left x),right)
      else if lt(y,x)
        then Node(y,left,(insert lt right x))
        else T;

exception EmptyTree;

fun deletemin(Empty) = raise EmptyTree
  | deletemin(Node(y,Empty,right)) = (y,right)
  | deletemin(Node(w,left,right)) =
      let
        val (y,L) = deletemin(left)
      in
        (y, Node(w,L,right))
      end;

fun delete lt Empty x = Empty
  | delete lt (Node(y,left,right)) x =
      if lt(x,y)
        then Node(y,(delete lt left x),right)
        else if lt(y,x)
          then Node(y,left,(delete lt right x))
          else case (left,right)
            of (Empty,r) => r
             | (l,Empty) => l
             | (l,r) => let
                 val (z,r1) = deletemin(r)
               in
                 Node(z,l,r1)
               end;

(*
Partially instantiate the functions lookup, insert, and delete defined in this
section to give two-argument functions that operate on a binary search tree and
a value, where the less-than function is:

a) < on reals.
*)

lookup Real.<;
insert Real.<;
delete Real.<;

(*
b) Lexicographic order on pairs of integers. That is, (a, b) < (c,d) if a < c
   or if a = c and b < d).
*)

fun ltpair lt ((a, b), (c, d)) =
  if lt(a, c)
    then true
    else if lt(c, a)
      then false
      else lt(b, d);

lookup (ltpair Int.<);
insert (ltpair Int.<);
delete (ltpair Int.<);

(*
c) Lexicographic order on lists of integers. That is, L < M if either L is
   a proper prefix of M or in the first position where L and M differ, the
   element of L is smaller than the element of M.
*)

fun lexlt lt (nil, _)       = true
  | lexlt lt (_,   nil)     = false
  | lexlt lt (l::ls, r::rs) = lt(l, r);

lookup (lexlt Int.<);
insert (lexlt Int.<);
delete (lexlt Int.<);

