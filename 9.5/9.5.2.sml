(*
Exercise 9.5.2

Write and export a function that takes a list of any number of integers on the
command line and computes their sum.
*)

fun sum(L) = List.foldl (fn (x, s) => valOf(Int.fromString(x)) + s) 0 L;

fun safeSum(_, L) = (
  print(Int.toString(sum(L)));
  print("\n");
  OS.Process.success
) handle Option => (
  print("Non integer supplied\n");
  OS.Process.failure
);

SMLofNJ.exportFn("sum", safeSum);

