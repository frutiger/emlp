(*
Exercise 5.4.3

When implementing either the trapezoidal rule or Simpson's rule, it is possible
to compute delta once and for all, rather than at each recursive call (although
as explained in the text, this strategy may cause roundoff errors to
accumulate).

Reimplement:

  a) The function trap of Fig. 5.14.

  b) Your function simpson from Exercise 5.4.2.

in such a way that delta is computed once.
*)

(*
5.4.3 (a)

Fig 5.14 is reproduced below:

fun trap(a,b,n,F) =
  if n<=0 orelse b-a<=0.0 then 0.0
  else
    let
      val delta = (b-a)/real(n)
    in
      delta*(F(a)+F(a+delta))/2.0 + trap(a+delta,b,n-1,F)
  end;
*)

fun trap1(a,b,n,F,delta) =
  if n<=0 orelse b-a<=0.0 then 0.0
  else delta*(F(a)+F(a+delta))/2.0 + trap1(a+delta,b,n-1,F,delta);

fun trap(a,b,n,F) =
  let
    val delta = (b-a)/real(n)
  in
    trap1(a,b,n,F,delta)
  end;

(*
5.4.3 (b)

The implementation of simpson in Exercise 5.4.2 already calculates delta only
once.
*)
