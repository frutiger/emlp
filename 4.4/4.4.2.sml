(*
Exercise 4.4.2

Rewrite makeList and makeList1 of Example 4.9 so the two functions are mutually
recursive.

Example 4.9 is reproduced below.

fun makeList1(infile, NONE)   = nil
  | makeList1(infile, SOME c) = c :: makeList1(infile, input1(infile));

fun makeList(infile) = makeList1(infile, input1(infile));
*)

open TextIO;

fun makeList1(infile, NONE)   = nil
  | makeList1(infile, SOME c) = c :: makeList(infile)

and makeList(infile) = makeList1(infile, input1(infile));

