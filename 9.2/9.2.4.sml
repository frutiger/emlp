(*
Exercise 9.2.4

Write a function that constructs a list of the prefixes of a given string using
the substring and size operators.
*)

fun prefixes1(s, 0) = nil
  | prefixes1(s, i) = substring(s, 0, i)::prefixes1(s, i - 1);

fun prefixes(s) = prefixes1(s, size(s) - 1);

