(*
Exercise 9.2.2

Is it possible to implement if x>3.0 then x else 0.0 using only the abs operator
and arithmetic?
*)

fun step x = (x + abs x) / (2.0 * x);

fun pos x = (x + abs x) / 2.0;

fun shiftHorizontal a F x = F(x - a:real);

fun greaterThreeOnly x = shiftHorizontal 3.0 (fn x => pos x + (3.0 * step x)) x;

