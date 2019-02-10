(*
Exercise 9.1.4

Repeat Exercise 9.1.3 but require that all operators be right-associative and
that polynomial operators take precedence over arithmetic operators.
*)

(* Fig 3.27 follows *)
fun padd(P,   nil) = P
  | padd(nil, Q)   = Q
  | padd((p : real)::ps, q::qs) = (p + q)::padd(ps, qs);

fun smult(q, nil)            = nil
  | smult(q, (p : real)::ps) = (p * q)::smult(q, ps);

fun pmult(P, nil) = nil
  | pmult(P, q::qs) = padd(smult(q, P), 0.0::pmult(P, qs));

(* The solution to Exercise 9.1.4 follows. *)
infixr 10 smult;
infixr  9 pmult;
infixr  8 padd;

