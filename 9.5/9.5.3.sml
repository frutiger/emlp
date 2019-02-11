(*
Exercise 9.5.3

Write and export a function that takes on the command line

  1. A real number x represented by digits with a decimal point somewhere in
     the middle, followed by

  2. An integer y,

and prints x^y.
*)

fun power(_, [x, y]) = (
  print(Real.toString(Math.pow(valOf(Real.fromString(x)),
                               real(valOf(Int.fromString(y))))));
  print("\n");
  OS.Process.success
) handle Option => (
  print("Could not parse number\n");
  OS.Process.failure
);

SMLofNJ.exportFn("power", power);

