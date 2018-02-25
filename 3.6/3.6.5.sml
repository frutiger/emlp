(*
Exercise 3.6.5

We can represent polynomials in two variables, x and y, by a list of lists.
Think of such a polynomial as a polynomial in x, whose coefficients, instead of
being real numbers, are polynomials in y.  Represent these polynomials in y by
lists as we did in Section 3.6.1.  Then use the lists representing these
polynomials as elements of a list representing the polynomial in x.  For example
the polynomial 1 + 2xy + 3xy^2 + 4x^3y can be written as 1 + (2y + 3y^2)x +
(4y)x^3.  The polynomial 2y + 3y^2 is represenented by the list [0.0, 2.0, 3.0]
and the polynomial 4y is represented by [0.0, 4.0].  Thus the polynomial in x
can be written
    [[1.0], [0.0, 2.0, 3.0], [], [0.0, 4.0]]
Write functions to add polynomials in two variables, scalar-multiply such
polynomials, and polynomial-multiply these polynomials.  You need not use a
"Karatsuba-Ofman" type trick to improve effiiency.
*)

fun padd(nil,          ys)    = ys
  | padd(xs,           nil)   = xs
  | padd((x:real)::xs, y::ys) = (x + y)::padd(xs, ys);

fun smult(nil,   s:real) = nil
  | smult(x::xs, s)      = (s * x)::smult(xs, s);

fun pmult(_,  nil)   = nil
  | pmult(xs, y::ys) = padd(smult(xs, y), 0.0::pmult(xs, ys));

fun p2add(nil,   ys)    = ys
  | p2add(xs,    nil)   = xs
  | p2add(x::xs, y::ys) = padd(x, y)::p2add(xs, ys);

fun s2mult(nil,   s) = nil
  | s2mult(x::xs, s) = smult(x, s)::s2mult(xs, s);

(* multiply a one-variable polynomial by a two-variable polynomial *)
fun p2mult1(nil,   y) = nil
  | p2mult1(x::xs, y) = pmult(x, y)::p2mult1(xs, y);

fun p2mult(nil,   _)  = nil
  | p2mult(x::xs, ys) = p2add(p2mult1(ys, x), [0.0]::p2mult(xs, ys));

