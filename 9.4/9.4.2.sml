(*
Exercise 9.4.2 : Write equivalents to the following expressions on real numbers
using only the sign function and arithmetic operators:

a) abs(x).
*)

fun abs(x:real) = real(Real.sign(x)) * x;

(*
b) if x>3.0 then x else 0.0.
*)

(*
Note: with the definition of abs above, we are able to reuse our solution from
Exercise 9.2.2
*)

fun step x = (x + abs x) / (2.0 * x);

fun pos x = (x + abs x) / 2.0;

fun shiftHorizontal a F x = F(x - a:real);

fun greaterThreeOnly x = shiftHorizontal 3.0 (fn x => pos x + (3.0 * step x)) x;

