(*
Exercise 9.4.5

Write a function f(x,a) = a^x, using the functions exp and ln from the structure
Real.Math.
*)

fun f(x, a) = Math.exp(x * Math.ln(a));

