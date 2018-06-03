(*
Exercise 5.1.3

A year is a leap year if and only if it is divisible by 4, but not by 100,
unless it is also divisible by 400.  Write a case expression that tells whether
a year y is a leap year.
*)
fun isLeap(y) =
  case (y mod 4, y mod 100, y mod 400)
  of (0, _, 0) => true
   | (0, 0, _) => false
   | (0, _, _) => true
   | (_, _, _) => false;

