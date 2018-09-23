(*
Exercise 5.4.7

Use the function filter to perform the following operations on a list L.

The function filter is reproduced below. *)

fun filter(P, nil)   = nil
  | filter(P, x::xs) = if P(x) then x::filter(P, xs) else filter(P, xs);

(* a) Find those elements of a list of reals that are greater than 0. *)

fun Fa(L) = filter(fn x => x > 0.0, L);

(* b) Find those elements of a list of reals that are between 1 and 2. *)

fun Fb(L) = filter(fn x => x >= 1.0 andalso x <= 2.0, L);

(* c) Find those elements of a list of strings that begin with the character
      #"a". *)

fun Fc(L) = filter(fn x => hd(explode(x)) = #"a", L);

(* d) Find those elements of a list of strings that are at most 3 characters
      long. *)

fun Fd(L) = filter(fn x => length(explode(x)) <= 3, L);

