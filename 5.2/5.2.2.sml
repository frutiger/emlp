(*
Exercise 5.2.2

Write a factorial function tha tproduces 1 when its argument is 0, produces 0
for a negative argument while printing an error message, and produces n! for a
positive argument n.  Organize your code so a function fact1 does the work of
computing n! and raises an exception Negative(n) if n is a negative integer.
*)

fun fact2(0) = 1
  | fact2(n) = n * fact2(n-1);

exception Negative of int;

fun fact1(n) = if   n < 0
               then raise Negative(n)
               else fact2(n);

fun fact(n) = fact1(n)
              handle Negative(_) => 0;

