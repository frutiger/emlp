(*
Exercise 5.4.2

Simpson's rule is a more accurate way to integrate functions numerically.  If
we evaluate a function F at 2n + 1 evenly spaced points,

  a, a+d, a+2d, ..., a+2nd

then we may estimate the integral \int_{a}^{a+2nd} F(x) dx by

  d(F(a) + 4F(a+d) + 2F(a+2d) + 4F(a+3d) + 2F(a+4d) + ...
    + 2F(a+(2n-2)d) + 4F(a+(2n-1)d) + F(a+2nd))/3

That is, the even-position terms all have a coefficient of 4, while the odd
position terms have coefficient 2, except for the first and last, which have
coefficient 1.  Wite a function simpson that takes starting and ending points a
and b, an integer n (such that the evaluation is to use 2n+1 points as above),
and a function F to integrate by Simpson's rule.  Try out your function on
polynomials x^2, x^3, and so on.  What is the smallest integer i such that
Simpson's rulee fails to get the exact integral of x^i with a=0.0, b=1.0 and
n=1?
*)

fun sum(F, x, d, 0) = 0.0
  | sum(F, x, d, n) = F(x+(d*real(n))) + sum(F, x, d, n-1);

fun simpson(F, a: real, b: real, n) =
  let
    val d = (b-a) / (2.0 * real(n));
  in
    (d / 3.0) * (F(a) + F(a+real(2*n)*d) + 4.0*F(a+d)
                 + 2.0*sum(F, a+(2.0*d), 2.0*d, n-1)
                 + 4.0*sum(F, a+(3.0*d), 2.0*d, n-1))
  end;

