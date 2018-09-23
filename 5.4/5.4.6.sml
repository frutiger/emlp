(*
Exercise 5.4.6

Use the function reduce to perform the following operations on a list L.

The function reduce is reproduced below. *)

exception EmptyList;

fun reduce(F, nil)    = raise EmptyList
  | reduce(F, x::nil) = x
  | reduce(F, x::xs)  = F(x, reduce(F, xs));

(* (a) Find the maximum of a list of reals, *)

fun Fa(L) = reduce(fn (x:real, y) => if y > x then y else x, L);

(* (b) Find the minimum of a list of reals. *)

fun Fb(L) = reduce(fn (x:real, y) => if y < x then y else x, L);

(* (c) Concatenate a list of characters (i.e., the function implode), *)

(* This is not really possible as stated, as implode returns a string. *)

(* (d) Find the logical OR of a list of booleans. *)

fun Fd(L) = reduce(fn (x, y) => x orelse y, L);

