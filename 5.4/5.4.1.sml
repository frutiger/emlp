(*
Exercise 5.4.1

Write a function tabulate that takes as arguments an initial argument a, an
increment d, a number of points n and a function F from reals to reals.  Print
a table with columns corresponding to values x and F(x), where x = a, a + d,
a + 2d, ..., a + (n - 1)d.
*)

fun tabulate(x, d, 0, F:real -> real) = ()
  | tabulate(x, d, n, F) = (
      print(Real.toString(x));
      print("\t");
      print(Real.toString(F(x)));
      print("\n");
      tabulate(x + d, d, n - 1, F)
    );

