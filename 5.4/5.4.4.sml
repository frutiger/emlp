(*
Exercise 5.4.4

Improve the function trap of Fig. 5.14 by printing an appropriate error message
and then raising an exception when the input is bad (as detected by line (1) of
Fig. 5.14).

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


open TextIO;
exception BadInput of string;

fun trap(a,b,n,F) =
  if b-a<=0.0 then (
    print("Bad Input, 'b' must be greater than 'a'");
    raise BadInput("Bad Input, 'b' must be greater than 'a'")
  )
  else if n<=0 orelse b-a<=0.0 then 0.0
  else
    let
      val delta = (b-a)/real(n)
    in
      delta*(F(a)+F(a+delta))/2.0 + trap(a+delta,b,n-1,F)
  end;

