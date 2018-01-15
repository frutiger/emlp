(*
Exercise 3.4.1

Write a succing function to compute x^1000.
*)

fun thousandthPower(x) =
  let
    val x2    = x*x
    val x4    = x2*x2
    val x8    = x4*x4
    val x40   = x8*x8*x8*x8*x8
    val x200  = x40*x40*x40*x40*x40
    val x1000 = x200*x200*x200*x200*x200
  in
    x1000
  end;

