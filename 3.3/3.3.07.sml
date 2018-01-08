(*
Exercise 3.3.7

There is a recursive definition of the square of a non-negative integer:
0^2 = 0 (basis) and n^2 = (n-1)^2 + 2n - 1 (inductive step for n > 0).  Write a
recursive function that computes the square of its argument using this inductive
formula.  *)

fun square(0) = 0
  | square(n) = square(n - 1) + 2*n - 1;

