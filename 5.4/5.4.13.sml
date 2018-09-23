(*
Exercise 5.4.13

Another use of polymorphic functions is to allow late binding of overloaded
symbols such as + or *. That is, instead of using these symbols in a function
f, we invent names for them such as plus and times, and we let these names be
parameters of the function f. Then, we can call f with appropriate definitions
for the parameters, thus binding the names to the correct meanings as late as
possible. As an exercise:

a) Write a function eval that takes as parameters functions representing scalar
   addition and multiplication, as well as taking a polynomial (represented as
   a list in the manner of Section 3.6) and a value at which to evaluate the
   polynomial.

b) Show how to call your function from (a) to evaluate the integer polynomial
   4x^3 + 3x^2 + 2x + 1 at the point x = 5.
*)

(* (a) *)

fun power(times, x, 0) = 1
  | power(times, x, n) = times(x, power(times, x, n-1));

fun eval2(times, c, p, x) = c * power(times, x, p);

fun eval1(plus, times, nil,   p, x) = 0
  | eval1(plus, times, c::cs, p, x) = plus(eval2(times, c, p, x),
                                           eval1(plus, times, cs, p+1, x));

fun eval(plus, times, cs, x) = eval1(plus, times, cs, 0, x);

(* (b) *)

eval(op+, op*, [1, 2, 3, 4], 5);

