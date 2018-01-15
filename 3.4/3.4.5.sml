(*
Exercise 3.4.5

Write a function to compute x^(2^i) for real x and nonnegative integer i.  You
should make only one recursive call in your function.  Hint: Note that we can
start x and apply the squaring operation i times.  For example, when i = 3, we
compute ((x^2)^2)^2.
*)

fun power2toN(x : real, 0) = x
  | power2toN(x, n) = power2toN(x * x, n - 1);

