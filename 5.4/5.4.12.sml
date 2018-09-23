(*
Exercise 5.4.12

Use the function reduceB from Exercise 5.4.11 to

   (a) Compute the length of a list.

   (b) Compute the list of suffixes of a list. For example, given the list
[1,2,3], produce [[1,2,3], [2,3], [3], nil].

The function reduceB is reproduced below. *)

fun reduceB(F, nil, g)   = g
  | reduceB(F, x::xs, g) = F(x, reduceB(F, xs, g));

(* (a) Compute the length of a list. *)

fun Fa(L) = reduceB(fn (x, y) => 1 + y, L, 0);

(* (b) Compute the list of suffixes of a list. For example, given the list
[1,2,3], produce [[1,2,3], [2,3], [3], nil]. *)

fun Fb(L) = reduceB(fn (x, y) => (x::hd(y))::y, L, [nil]);

