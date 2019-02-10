(*
Exercise 9.2.8

Several of the functions of the top-level environment can be defined by using
other functions of the top-level environment. Write the following in terms of
other top-level functions:

a) isSome.
*)

fun isSome(SOME _) = true
  | isSome(NONE)   = false;

(*
b) valOf.
*)

fun valOf(SOME x) = x
  | valOf(NONE)   = raise Option;

(*
c) getOpt.
*)

fun getOpt(SOME x, _) = x
  | getOpt(NONE,   y) = y;

(*
d) null.
*)

fun null(nil) = true
  | null(_)   = false;

(*
e) ignore.
*)

fun ignore(x) = (x; ());

(*
f) before.
*)

fun op before(x, _) = x;

(*
g) app.
*)

fun app(F, nil) = ()
  | app(F, x::xs) = F(x) before app(F, xs);

(*
h) not.
*)

fun not(true)  = false
  | not(false) = true;

(*
i) The dereferencing function !.
*)

fun op !(ref x) = x;

(*
j) substring.
*)

fun substring1(_,   0, 0) = nil
  | substring1(nil, _, _) = raise Subscript
  | substring1(x::xs, 0, j) = x::substring1(xs, 0, j-1)
  | substring1(x::xs, i, j) = substring1(xs, i-1, j);

fun substring(s, i, j) = implode(substring1(explode(s), i, j));

