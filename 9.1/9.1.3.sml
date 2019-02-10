(*
Exercise 9.1.3

Figure 3.27 gave three functions that operated on polynomials: padd (polynomial
addition), smult (multiplication of a scalar by a polynomial), and pmult
(multiplications of polynomials). Each is a function of two parameters, so we
can make them be infix operators.
*)

(* Fig 3.27 follows *)
fun padd(P,   nil) = P
  | padd(nil, Q)   = Q
  | padd((p : real)::ps, q::qs) = (p + q)::padd(ps, qs);

fun smult(q, nil)            = nil
  | smult(q, (p : real)::ps) = (p * q)::smult(q, ps);

fun pmult(P, nil) = nil
  | pmult(P, q::qs) = padd(smult(q, P), 0.0::pmult(P, qs));

(*
a) Suggest a way to define these operators so that
    1. pmult takes precedence over padd.
    2. smult takes precedence over pmult.
    3. All three are left-associative.
    4. The arithmetic operators on reals take precedence over the polynomial
       operators. For example, 2.0 + 3.0 smult P is interpreted as (2+3)P
       rather than an erroneous attempt to add 2 to the polynomial 3P.
*)

infix 5 smult;
infix 4 pmult;
infix 3 padd;

(*
b) Show how to write the expression (P + 2Q) x R, where P is the polynomial
3x^4 + 5x^2 - 6, Q = x^3 + 2x^2 - 3x + 4, and R = x + 1, using the infix
operators and using parentheses only when necessary.
*)

val P = [~6.0,  0.0, 5.0, 0.0, 3.0];
val Q = [ 4.0, ~3.0, 2.0, 1.0];
val R = [ 1.0,  1.0];

(P padd 2.0 smult Q) pmult R;

nonfix smult;
nonfix pmult;
nonfix padd;
