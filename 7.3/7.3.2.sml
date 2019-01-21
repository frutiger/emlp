(*
Exercise 7.3.2

Write expressions to compute the following functions of the values referred to
by ref-variables x and y, which we shall assume refer to reals.

*)
val x = ref 2.0;
val y = ref 3.0;
(*
a) The square of the sum of the values referred to by x and y.
*)

let
  val s = !x + !y
in
  s*s
end;

(*
b) The average of the values referred to by x and y.
*)

(!x + !y) / 2.0;

