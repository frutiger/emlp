(*
Exercise 4.1.3

Write a function that, given integer n, prints 2^n X's using n recursive calls.
Hint: Compute the desired string recursively before printing it.
*)

fun genPower2Xs(0) = "X"
  | genPower2Xs(n) =
  let
    val sub = genPower2Xs(n-1)
  in
    concat([sub, sub])
  end;

fun printPower2Xs(n) = (
  print(genPower2Xs(n));
  print("\n")
  );

